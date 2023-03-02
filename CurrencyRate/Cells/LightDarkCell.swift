//
//  LightDarkCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 1.03.23.
//

import UIKit

final class LightDarkCell: UITableViewCell {
    
    @IBOutlet private weak var labelTheme: UILabel!
   
    
    func configure(theme: String) {
        labelTheme.text = theme
    }

}
