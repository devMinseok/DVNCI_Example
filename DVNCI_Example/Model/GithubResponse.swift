//
//  GithubResponse.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//

import Foundation

struct GithubResponse: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
