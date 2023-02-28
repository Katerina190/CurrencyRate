//
//  SettingsVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 9.02.23.
//

import UIKit

final class SettingsVC: UIViewController {
    
    @IBOutlet private weak var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "SettingCell", bundle: nil)
        tableViewSettings.register(nibCell, forCellReuseIdentifier: "SettingCell")
        tableViewSettings.dataSource = self
    }
}

extension SettingsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
            cell.configure(with: "This is some test info")
        cell.layer.cornerRadius = 10
        return cell
    }
}
