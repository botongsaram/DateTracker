//
//  DateView.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/3/25.
//

import UIKit

final class DateTableViewCell: UITableViewCell {
    static let cellId = "DateTableViewCell"
    let stackView = UIStackView()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.attachToParentView(parentView: self, horizontal: 12, vertical: 24)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(descriptionLabel)
        dateLabel.textAlignment = .left
        dateLabel.numberOfLines = 0
    }
    
    func configure(value: String? = nil, eventDescription: String? = nil) {
        if let dateValue = value {
            let mutableAttributedStr: NSMutableAttributedString = .init()
            let dateAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
                .foregroundColor: UIColor.label
            ]
            mutableAttributedStr.append(NSAttributedString(string: dateValue, attributes: dateAttributes))
            if let description = eventDescription {
                let descriptionAttributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                    .foregroundColor: UIColor.secondaryLabel
                ]
                mutableAttributedStr.append(NSAttributedString(string: " since \(description)", attributes: descriptionAttributes))
            }
            dateLabel.attributedText = mutableAttributedStr
        }
    }
}
