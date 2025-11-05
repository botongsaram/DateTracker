//
//  DateView.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/3/25.
//

import UIKit

final class DateView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        backgroundColor = .green
    }
}
