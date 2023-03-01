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
        let nibNotifCell = UINib(nibName: "NotificationCell", bundle: nil)
        let nibContactCell = UINib(nibName: "ContactUsCell", bundle: nil)
        
        tableViewSettings.register(nibCell, forCellReuseIdentifier: "SettingCell")
        tableViewSettings.register(nibNotifCell, forCellReuseIdentifier: "NotificationCell")
        tableViewSettings.register(nibContactCell, forCellReuseIdentifier: "ContactUsCell")
        
        tableViewSettings.dataSource = self
        tableViewSettings.delegate = self
    }
}

extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
            cell.configure(with: "Language")
            cell.layer.cornerRadius = 10
            return cell
        }
        else if indexPath.section == 0 && indexPath.row == 1 {
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
            cell.configure(label: "Notifications")
            return cell
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "ContactUsCell", for: indexPath) as! ContactUsCell
            cell.configure(contact: "Contact us")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "General"
        } else if section == 1 {
            return "Additional"
        }
        return ""
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let url = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
