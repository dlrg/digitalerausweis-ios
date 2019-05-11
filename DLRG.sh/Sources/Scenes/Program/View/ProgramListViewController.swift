//
//  ProgramListViewController.swift
//  DLRG.sh
//
//  Created by jb on 11.05.19.
//  Copyright © 2019 DLRG-Jugend Schleswig-Holstein. All rights reserved.
//

import UIKit

class ProgramListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var viewModel: ProgramViewModel? {
        didSet {
            reload()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func reload() {
        viewModel?.loadProgram { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.reloadData()
            if let error = self.viewModel?.error {
                self.showError(error) { [weak self] in self?.reload() }
            }
        }
    }

    private func showError(_ error: Error, _ completion: @escaping (() -> ())) {
        let alert = UIAlertController(title: "Fehler 😢", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in completion() }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ProgramListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.points.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel,
            indexPath.section == 0,
            viewModel.points.count > indexPath.row else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.programPointTableViewCell, for: indexPath)!
        let point = viewModel.points[indexPath.row]
        cell.name.text = point.name
        cell.day.text = point.day
        return cell
    }
}
