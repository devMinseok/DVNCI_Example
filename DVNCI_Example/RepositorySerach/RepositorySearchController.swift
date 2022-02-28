//
//  RepositorySearchController.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import UIKit

// MARK: - RepositorySearchControllerProtocol
protocol RepositorySearchControllerProtocol: AnyObject {
    var view_: RepositorySearchViewProtocol? { get set }
    var interactor: RepositorySearchInteractorProtocol? { get set }
    var navigator: RepositorySearchNavigatorProtocol? { get set }
    var dataSource: RepositorySearchDataSourceProtocol? { get set }
}

final class RepositorySearchController: UIViewController {
    
// MARK: - Lifecycle Methods
    override func loadView() {
        view = view_ as? RepositorySearchView
    }

// MARK: - Properties
    var view_: RepositorySearchViewProtocol?
    var interactor: RepositorySearchInteractorProtocol?
    var navigator: RepositorySearchNavigatorProtocol?
    var dataSource: RepositorySearchDataSourceProtocol?
}

// MARK: - RepositorySearchControllerProtocol Methods
extension RepositorySearchController: RepositorySearchControllerProtocol {}
