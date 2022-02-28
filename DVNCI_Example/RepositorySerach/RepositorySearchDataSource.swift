//
//  RepositorySearchDataSource.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import UIKit

// MARK: - RepositorySearchDataSourceProtocol
protocol RepositorySearchDataSourceProtocol {
    var controller: RepositorySearchControllerProtocol? { get set }
}

final class RepositorySearchDataSource: NSObject {
    
// MARK: - Properties
    weak var controller: RepositorySearchControllerProtocol?
}

// MARK: - RepositorySearchDataSourceProtocol Methods
extension RepositorySearchDataSource: RepositorySearchDataSourceProtocol {}
