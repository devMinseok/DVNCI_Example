//
//  RepositorySearchView.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/02/28.
//  
//

import UIKit

import FlexLayout
import PinLayout

// MARK: - RepositorySearchViewProtocol
protocol RepositorySearchViewProtocol {
    var controller: RepositorySearchControllerProtocol? { get set }
}

final class RepositorySearchView: UIView {

// MARK: - Properties
    weak var controller: RepositorySearchControllerProtocol?
    
    fileprivate let rootFlexContainer = UIView()
    
    var searchField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        addSubview(rootFlexContainer)
        
        rootFlexContainer.flex
            .direction(.column)
            .paddingHorizontal(20)
            .define { flex in
                flex.addItem()
                    .direction(.row)
                    .paddingVertical(20)
                    .define { flex in
                        flex.addItem(searchField)
                            .grow(9)
                        flex.addItem(searchButton)
                            .grow(1)
                    }
                
                flex.addItem(tableView)
                    .grow(10)
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout()
    }
}

// MARK: - RepositorySearchViewProtocol Methods
extension RepositorySearchView: RepositorySearchViewProtocol {}
