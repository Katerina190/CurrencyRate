//
//  SettingCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 9.02.23.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet private weak var infoLabel: UILabel!    
    
    
     func configure(with info: String) {
        infoLabel.text = info
    }
}
