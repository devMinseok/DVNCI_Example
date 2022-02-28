//
//  RepositorySearchNavigator.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import Foundation
import UIKit

// MARK: - RepositorySearchNavigatorProtocol
protocol RepositorySearchNavigatorProtocol {}

final class RepositorySearchNavigator: RepositorySearchNavigatorProtocol {
    
// MARK: - Static methods
    static func createModule() -> UIViewController {
        
        let controller = RepositorySearchController()
        
        controller.dataSource = RepositorySearchDataSource()
        controller.dataSource?.controller = controller
        controller.navigator = RepositorySearchNavigator()
        controller.view_ = RepositorySearchView()
        controller.view_?.controller = controller
        controller.interactor = RepositorySearchInteractor()
        controller.interactor?.controller = controller
    
        return controller
    }
}
