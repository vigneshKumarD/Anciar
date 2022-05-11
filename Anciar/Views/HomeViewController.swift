//
//  HomeViewController.swift
//  Anciar
//
//  Created by Vignesh Kumar on 5/9/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        viewModel.fetchData { error in
            guard error != nil else {
            //handle error
             return
            }
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 150
        } else {
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fetchNumberOfRowsPerSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            return getDoubleElementCell(tableView, indexPath: indexPath)
        } else {
            return getSingleElementCell(tableView, indexPath: indexPath)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.fetchNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let confirmedHeaderView = view as? UITableViewHeaderFooterView {
            confirmedHeaderView.textLabel?.text = viewModel.fetchSectionTitle(section)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.fetchSectionTitle(section)
    }
    
    private func getSingleElementCell(_ tableView: UITableView, indexPath: IndexPath) -> TableViewSingleElementCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewSingleElementCell.identifier,
                                                    for: indexPath) as? TableViewSingleElementCell,
            let data = viewModel.fetchDataForSection(indexPath.section, row: indexPath.row),
            let confirmedUrl = data.firstImageUrl {
            cell.setImage(imagePath: confirmedUrl)
            return cell
        }
        return TableViewSingleElementCell()
    }
    
    private func getDoubleElementCell(_ tableView: UITableView, indexPath: IndexPath) -> TableViewDoubleElementCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewDoubleElementCell.identifier,
                                                    for: indexPath) as? TableViewDoubleElementCell,
            let data = viewModel.fetchDataForSection(indexPath.section, row: indexPath.row) {
            if let confirmedFirstUrl = data.firstImageUrl {
                cell.setLeftImage(imagePath: confirmedFirstUrl)
            }
            
            if let confirmedSecondUrl = data.secondImageUrl {
                cell.setRightImage(imagePath: confirmedSecondUrl)
            }
            return cell
        }
        return TableViewDoubleElementCell()
    }
}

