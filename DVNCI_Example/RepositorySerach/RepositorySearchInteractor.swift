//
//  RepositorySearchInteractor.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import Foundation

// MARK: - RepositorySearchInteractorProtocol
protocol RepositorySearchInteractorProtocol {
    var controller: RepositorySearchControllerProtocol? { get set }
}

final class RepositorySearchInteractor: RepositorySearchInteractorProtocol {

// MARK: - Properties
    weak var controller: RepositorySearchControllerProtocol?
}
