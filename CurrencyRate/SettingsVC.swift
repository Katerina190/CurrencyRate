//
//  SettingsVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 9.02.23.
//

import UIKit
import MessageUI

final class SettingsVC: UIViewController {
    
    @IBOutlet private weak var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "SettingCell", bundle: nil)
        let nibNotifCell = UINib(nibName: "NotificationCell", bundle: nil)
        let themeCell = UINib(nibName: "LightDarkCell", bundle: nil)
        let nibContactCell = UINib(nibName: "ContactUsCell", bundle: nil)
        
        tableViewSettings.register(nibCell, forCellReuseIdentifier: "SettingCell")
        tableViewSettings.register(nibNotifCell, forCellReuseIdentifier: "NotificationCell")
        tableViewSettings.register(themeCell, forCellReuseIdentifier: "LightDarkCell")
        tableViewSettings.register(nibContactCell, forCellReuseIdentifier: "ContactUsCell")
        
        tableViewSettings.dataSource = self
        tableViewSettings.delegate = self
    
    }
    
   
}

extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        }
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {            
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
            cell.configure(with: "Язык")
            cell.layer.cornerRadius = 10
            return cell
        }
        else if indexPath.section == 0 && indexPath.row == 1 {
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
            cell.configure(label: "Уведомления")
            return cell
        } else if indexPath.section == 1 {
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "LightDarkCell", for: indexPath) as! LightDarkCell
            cell.configure(theme: "Тема приложения")
            return cell
        }
        else if indexPath.section == 2 && indexPath.row == 0 {
            let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "ContactUsCell", for: indexPath) as! ContactUsCell
            cell.configure(contact: "Связь с разработчиком")
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
            return "Основные"
        } else if section == 1 {
            return "Дополнительные"
        } else if section == 2 {
            return "Связаться с нами"
        }
        return ""
    }
    
    func presentAppearanceVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(AppearanceVC.self)") as! AppearanceVC
        present(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let url = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
                presentAppearanceVC()
        } else if indexPath.section == 2 && indexPath.row == 0 {
            let mailComposeViewController = MFMailComposeViewController()
                mailComposeViewController.setToRecipients(["fatcat2019@gmail.com"])
                self.present(mailComposeViewController, animated: true, completion: nil)
        }
    }
}
    

