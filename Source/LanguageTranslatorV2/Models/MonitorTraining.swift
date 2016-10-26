/**
 * Copyright IBM Corporation 2016
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

/** The training status of a translation model. */
public struct MonitorTraining: JSONDecodable {

    /// The status of training (available, training, or error).
    public let status: TrainingStatus

    /// The base model that this translation model was trained on.
    public let baseModelID: String

    /// Used internally to initialize a `MonitorTraining` model from JSON.
    public init(json: [String: Any]) throws {
        guard let status = TrainingStatus(rawValue: try json.getString(at: "status")) else {
            let type = type(of: TrainingStatus.available)
            throw JSON.Error.valueNotConvertible(value: json, to: type)
        }
        self.status = status
        self.baseModelID = try json.getString(at: "base_model_id")
    }
}
