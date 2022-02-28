//
//  Repository.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//

import Foundation

struct Repository: Decodable {
    let fullName: String?
    let description: String?
    let htmlUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case description
        case htmlUrl = "html_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fullName = try? container.decode(String.self, forKey: .fullName)
        description = try? container.decode(String.self, forKey: .description)
        htmlUrl = try? container.decode(String.self, forKey: .htmlUrl)
    }
}
