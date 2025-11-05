//
//  ViewController.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/3/25.
//

import UIKit

final class ViewController: UIViewController {
    let titleView = TitleView()
    let dateView = DateView()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    private func updateUI() {
        view.backgroundColor = .gray
        
        view.addSubview(titleView)
        view.addSubview(dateView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        dateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            dateView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16),
            dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            dateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        titleView.contentMode = .center
    }

}

