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
    
    func setItems(from data: Data?)
}

final class RepositorySearchDataSource: NSObject {
    
// MARK: - Properties
    weak var controller: RepositorySearchControllerProtocol?
    
    private(set) var items: [Repository] = [] {
        didSet {
            controller?.reloadTableView()
        }
    }
}

// MARK: - RepositorySearchDataSourceProtocol Methods
extension RepositorySearchDataSource: RepositorySearchDataSourceProtocol {
    func setItems(from data: Data?) {
        guard let data = data else { return }
        
        do {
            let response = try JSONDecoder().decode(GithubResponse.self, from: data)
            items = response.items
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension RepositorySearchDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell") as? RepositoryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(from: item)
        return cell
    }
}
