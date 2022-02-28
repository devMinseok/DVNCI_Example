//
//  RepositorySearchView.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import UIKit

// MARK: - RepositorySearchViewProtocol
protocol RepositorySearchViewProtocol {
    var controller: RepositorySearchControllerProtocol? { get set }
}

final class RepositorySearchView: UIView {

// MARK: - Properties
    weak var controller: RepositorySearchControllerProtocol?
}

// MARK: - RepositorySearchViewProtocol Methods
extension RepositorySearchView: RepositorySearchViewProtocol {}
