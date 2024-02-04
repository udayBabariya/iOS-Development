//
//  ViewController.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        getAPIData()
    }
    
    func getAPIData() {
        viewModel.getDocuments { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        cell.setupData(document: viewModel.documents[indexPath.row])
        return cell
    }
    
    
}

