//
//  RepositorySearchInteractor.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import Foundation
import Alamofire

// MARK: - RepositorySearchInteractorProtocol
protocol RepositorySearchInteractorProtocol {
    var controller: RepositorySearchControllerProtocol? { get set }
    
    func searchGithubRepository(from text: String?)
}

final class RepositorySearchInteractor: RepositorySearchInteractorProtocol {

// MARK: - Properties
    weak var controller: RepositorySearchControllerProtocol?
    
    func searchGithubRepository(from text: String?) {
        let url = "https://api.github.com/search/repositories?q=\(text ?? "")&page=1"
            
        AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json"],
            interceptor: nil,
            requestModifier: nil
        ).responseData { [weak self] response in
            switch response.result {
            case .success:
                self?.controller?.setDataSource(with: response.data)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
