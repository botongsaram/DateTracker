//
//  DateView.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/3/25.
//

import UIKit

struct DateSection {
    let title: String
    var rowItems: [RowItem]
}

struct RowItem {
    let id: Int
    let date: Date
    let dateUnit: DateUnit?
}

enum DateUnit: String {
    case day = "Day"
    case week = "Week"
    case month = "Month"
    case year = "Year"
    
    func dateUnitToString(isSingleUnit: Bool) -> String {
        return "\(self.rawValue)s"
    }
}

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
    
    func configure(date: Date, dateUnit: DateUnit? = nil) {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        let string = dateformatter.string(from: date)
        dateLabel.text = string
        titleLabel.text = dateUnit?.rawValue
    }
}
