//
//  Repository.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//

import Foundation

struct Repository: Decodable {
    let name: String?
    let fullName: String?
    let description: String?
    let htmlUrl: String?
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case description
        case htmlUrl = "html_url"
        case language
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        fullName = try? container.decode(String.self, forKey: .fullName)
        description = try? container.decode(String.self, forKey: .description)
        htmlUrl = try? container.decode(String.self, forKey: .htmlUrl)
        language = try? container.decode(String.self, forKey: .language)
    }
}
