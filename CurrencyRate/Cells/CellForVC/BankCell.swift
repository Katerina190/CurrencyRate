//
//  BankCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 14.02.23.
//

import UIKit

final class BankCell: UITableViewCell {

        @IBOutlet private weak var bankLabel: UILabel!
        @IBOutlet private weak var usdLabel: UILabel!
        @IBOutlet private weak var euroLabel: UILabel!
        @IBOutlet private weak var rusLabel: UILabel!
        @IBOutlet private weak var usdLabelSell: UILabel!
        @IBOutlet private weak var euroLabelSell: UILabel!
        @IBOutlet private weak var rusLabelSell: UILabel!
    
        
        
    func setup(bankName: String, usdRate: String, usdRateSell: String, euroRate: String, euroRateSell: String, rusRate: String, rusRateSell: String) {
            bankLabel.text = bankName
            usdLabel.text = usdRate
            usdLabelSell.text = usdRateSell
            euroLabel.text = euroRate
            euroLabelSell.text = euroRateSell
            rusLabel.text = rusRate
            rusLabelSell.text = rusRateSell
        }
    }

