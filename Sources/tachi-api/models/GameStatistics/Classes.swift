// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let classes = try? newJSONDecoder().decode(Classes.self, from: jsonData)

import Foundation

// MARK: - Classes

public struct Classes: Codable {
    public let dan, vfClass: Int?

    public init(dan: Int?, vfClass: Int?) {
        self.dan = dan
        self.vfClass = vfClass
    }
}
