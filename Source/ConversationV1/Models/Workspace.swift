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

/** Workspace. */
public struct Workspace: JSONDecodable, JSONEncodable {

    /// The name of the workspace.
    public let name: String

    /// The language of the workspace.
    public let language: String

    /// The timestamp for creation of the workspace.
    public let created: String

    /// The timestamp for the last update to the workspace.
    public let updated: String

    /// The workspace ID.
    public let workspaceID: String

    /// The description of the workspace.
    public let description: String?

    /// Any metadata that is required by the workspace.
    public let metadata: [String: Any]?

    /// Whether training data from the workspace can be used by IBM for general service improvements. `true` indicates that workspace training data is not to be used.
    public let learningOptOut: Bool?

    /**
     Initialize a `Workspace` with member variables.

     - parameter name: The name of the workspace.
     - parameter language: The language of the workspace.
     - parameter created: The timestamp for creation of the workspace.
     - parameter updated: The timestamp for the last update to the workspace.
     - parameter workspaceID: The workspace ID.
     - parameter description: The description of the workspace.
     - parameter metadata: Any metadata that is required by the workspace.
     - parameter learningOptOut: Whether training data from the workspace can be used by IBM for general service improvements. `true` indicates that workspace training data is not to be used.

     - returns: An initialized `Workspace`.
    */
    public init(name: String, language: String, created: String, updated: String, workspaceID: String, description: String? = nil, metadata: [String: Any]? = nil, learningOptOut: Bool? = nil) {
        self.name = name
        self.language = language
        self.created = created
        self.updated = updated
        self.workspaceID = workspaceID
        self.description = description
        self.metadata = metadata
        self.learningOptOut = learningOptOut
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `Workspace` model from JSON.
    public init(json: JSON) throws {
        name = try json.getString(at: "name")
        language = try json.getString(at: "language")
        created = try json.getString(at: "created")
        updated = try json.getString(at: "updated")
        workspaceID = try json.getString(at: "workspace_id")
        description = try? json.getString(at: "description")
        metadata = try? json.getDictionaryObject(at: "metadata")
        learningOptOut = try? json.getBool(at: "learning_opt_out")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `Workspace` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["name"] = name
        json["language"] = language
        json["created"] = created
        json["updated"] = updated
        json["workspace_id"] = workspaceID
        if let description = description { json["description"] = description }
        if let metadata = metadata { json["metadata"] = metadata }
        if let learningOptOut = learningOptOut { json["learning_opt_out"] = learningOptOut }
        return json
    }
}
