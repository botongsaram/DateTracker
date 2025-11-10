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
    let titleLabel = UILabel()
    
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
        stackView.addArrangedSubview(titleLabel)
    }
    
    func configure(value: String? = nil, dateUnit: DateUnit? = nil) {
        dateLabel.text = value
        titleLabel.text = dateUnit?.rawValue
    }
}
