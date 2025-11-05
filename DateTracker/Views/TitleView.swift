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
    let timeElapsedLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        [titleImage, titleLabel, timeElapsedLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: topAnchor),
            titleImage.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            titleImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            timeElapsedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            timeElapsedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeElapsedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeElapsedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        titleLabel.text = "Baby was born"
        titleLabel.textAlignment = .center
        
        timeElapsedLabel.text = "Time Elapsed"
        timeElapsedLabel.textAlignment = .center
    }
    
}
