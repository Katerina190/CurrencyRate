//
//  CoursesVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 6.02.23.
//

import UIKit


final class CoursesVC: UIViewController {
    var currencies: [Model]  = []
    private var networkService = NetworkService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        networkService.loadPosts { currencies in
            self.currencies = currencies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
            
        }
    }
        
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
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

