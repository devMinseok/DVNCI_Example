//
//  RepositoryTableViewCell.swift
//  DVNCI_Example
//
//  Created by 강민석 on 2022/03/01.
//

import UIKit

import FlexLayout
import PinLayout

final class RepositoryTableViewCell: UITableViewCell {
    
    fileprivate let rootFlexContainer = UIView()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    var languageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white
        contentView.addSubview(rootFlexContainer)

        rootFlexContainer.flex
            .direction(.row)
            .paddingHorizontal(10)
            .define { flex in
                flex.addItem()
                    .grow(8)
                    .direction(.column)
                    .justifyContent(.center)
                    .define { flex in
                        flex.addItem(titleLabel)
                        flex.addItem(descriptionLabel)
                    }

                flex.addItem(languageLabel)
                    .grow(1)
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
    func configure(from repository: Repository) {
        titleLabel.text = repository.name
        descriptionLabel.text = repository.description
        languageLabel.text = repository.language
    }
}
