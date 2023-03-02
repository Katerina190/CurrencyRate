//
//  CoursesVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 6.02.23.
//

import UIKit


final class CoursesVC: UIViewController {
    private var currencies: [Model]  = []
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        searchBar.delegate = self
        
        networkService.loadPosts { currencies in
            self.currencies = currencies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
        }
    }
    
    
    @IBOutlet private weak var searchBar: UISearchBar!
        
    @IBAction private func barItemLoad() {
        loadCourse()
        
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }


private func loadCourse() {
    networkService.loadPosts { currencies in
        self.currencies = currencies
        self.tableView.reloadData()
    }
}

}
extension CoursesVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as? TableViewCell
        let post = currencies[indexPath.row]
        
        let flagImage = UIImage(named: "\(post.Cur_Abbreviation)")
        cell?.flagImage.image = flagImage
    
        cell?.setup(Cur_Name: post.Cur_Name, cur_value: post.Cur_OfficialRate, cur_scale: post.Cur_Scale)
        return cell ?? UITableViewCell()
    }
    
    
}

extension CoursesVC: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            loadCourse()
        } else {
            networkService.loadPosts { currencies in
                self.currencies = currencies.filter {
                    $0.Cur_Name.lowercased().contains(searchText.lowercased()) }
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.text = ""
        }
}

