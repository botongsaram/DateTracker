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
    let mockData: [DateSection] = [
        DateSection(
            title: "Event Date",
            rowItems: [
                RowItem(id: 1, date: Date(timeIntervalSince1970: 1755788375), dateUnit: nil)
            ]
        ),
        DateSection(
            title: "Time Elapsed",
            rowItems: [
                RowItem(id: 1, date: Date(timeIntervalSince1970: 1755788375), dateUnit: .day),
                RowItem(id: 2, date:Date(timeIntervalSince1970: 1755788375), dateUnit: .week),
                RowItem(id: 3, date: Date(timeIntervalSince1970: 1755788375), dateUnit: .month),
                RowItem(id: 4, date: Date(timeIntervalSince1970: 1755788375), dateUnit: .year)
            ]
        )
    ]
    
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
        return mockData.count // Returns the number of sections in the main array
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData[section].rowItems.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mockData[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.cellId, for: indexPath) as! DateTableViewCell
        let sectionData = mockData[indexPath.section]
        let rowItem = sectionData.rowItems[indexPath.row]
        cell.configure(date: rowItem.date, dateUnit: rowItem.dateUnit ?? nil)
        return cell
    }
}
