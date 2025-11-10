//
//  ViewController.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/3/25.
//

import UIKit

final class ViewController: UIViewController {
    let titleView = TitleView()
    let tableView = UITableView()
    let mockDate: Date = Date(timeIntervalSince1970: 1755788375)
    let dateModel: DateModel = .init(eventDate: Date(timeIntervalSince1970: 1755788375))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateUI()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.cellId)
    }
    
    private func updateUI() {
        [titleView, tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        titleView.contentMode = .center
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dateModel.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateModel.viewModel?[section].rowItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dateModel.viewModel?[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.cellId, for: indexPath) as! DateTableViewCell
        if let sectionData = dateModel.viewModel?[indexPath.section] {
            let rowItem = sectionData.rowItems[indexPath.row]
            cell.configure(value: rowItem.value, dateUnit: rowItem.dateUnit ?? nil)
            return cell
        }
        return cell
    }
}
