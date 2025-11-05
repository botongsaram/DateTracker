//
//  help.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/3/25.
//

import UIKit

extension UIView {
    func attachToParentView(parentView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -constant),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -constant)
        ])
    }
}
