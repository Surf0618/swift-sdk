/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import RestKit

/** Intent. */
public struct Intent: JSONDecodable, JSONEncodable {

    /// The name of the intent.
    public let intentName: String

    /// The timestamp for creation of the intent.
    public let created: String

    /// The timestamp for the last update to the intent.
    public let updated: String

    /// The description of the intent.
    public let description: String?

    /**
     Initialize a `Intent` with member variables.

     - parameter intentName: The name of the intent.
     - parameter created: The timestamp for creation of the intent.
     - parameter updated: The timestamp for the last update to the intent.
     - parameter description: The description of the intent.

     - returns: An initialized `Intent`.
    */
    public init(intentName: String, created: String, updated: String, description: String? = nil) {
        self.intentName = intentName
        self.created = created
        self.updated = updated
        self.description = description
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `Intent` model from JSON.
    public init(json: JSON) throws {
        intentName = try json.getString(at: "intent")
        created = try json.getString(at: "created")
        updated = try json.getString(at: "updated")
        description = try? json.getString(at: "description")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `Intent` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["intent"] = intentName
        json["created"] = created
        json["updated"] = updated
        if let description = description { json["description"] = description }
        return json
    }
}
