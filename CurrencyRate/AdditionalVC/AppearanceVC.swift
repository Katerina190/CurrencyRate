//
//  AppearanceVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 1.03.23.
//

import UIKit

final class AppearanceVC: UIViewController {
    
    var myVC = BanksVC()
    
    @IBOutlet private weak var themeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        themeTableView.delegate = self
        themeTableView.dataSource = self
        
        let nibCell = UINib(nibName: "ThemeCell", bundle: nil)
        themeTableView.register(nibCell, forCellReuseIdentifier: "ThemeCell")
        
    }
}

extension AppearanceVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeCell", for: indexPath) as! ThemeCell
            cell.configure(name: "Светлая", image: UIImage(systemName: "moon.circle")!)
            return cell
        }
        else if indexPath.row == 1 {
            let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeCell", for: indexPath) as! ThemeCell
            cell.configure(name: "Темная", image: UIImage(systemName: "moon.circle.fill")!)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.view.window?.overrideUserInterfaceStyle = .light
        } else if indexPath.row == 1 {
            self.view.window?.overrideUserInterfaceStyle = .dark
      
        }
        
    }
    
}
