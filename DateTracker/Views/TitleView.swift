//
//  TitleView.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/4/25.
//

import UIKit

final class TitleView: UIView {
    lazy var titleImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "babyImage")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        [titleImage, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: topAnchor),
            titleImage.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            titleImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }
    
    func configure(title: String) {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24, weight: .bold),
            .foregroundColor: UIColor.label
        ]
        titleLabel.attributedText = NSAttributedString(string: title, attributes: textAttributes)
    }
    
}
