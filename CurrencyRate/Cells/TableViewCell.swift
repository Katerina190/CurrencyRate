//
//  TableViewCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 5.02.23.
//

import UIKit


final class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(Cur_Name: String, cur_value: Double, cur_scale: Int) {
        titleLabel.text = "\(cur_scale) \(Cur_Name)"
        moneyLable.text = "\(cur_value)"
        
    }
    @IBOutlet private weak var moneyLable: UILabel!
    @IBOutlet private weak var scaleLabel: UILabel!
    
}
