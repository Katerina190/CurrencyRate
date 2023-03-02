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
    
    @IBOutlet private weak var nameUSD: UILabel!
    @IBOutlet private weak var nameEUR: UILabel!
    @IBOutlet private weak var nameRUB: UILabel!
    func config(usd: String, eur: String, rub: String) {
        nameEUR.text = eur
        nameUSD.text = usd
        nameRUB.text = rub
    }
    
    let darkGreenColor = UIColor(red: 140/255, green: 0/255, blue: 56/255, alpha: 1)
    let lightGreenColor = UIColor(red: 194/255, green: 252/255, blue: 235/255, alpha: 1)
        
    func setup(bankName: String, usdRate: String, usdRateSell: String, euroRate: String, euroRateSell: String, rusRate: String, rusRateSell: String) {
            bankLabel.text = bankName
            usdLabel.text = usdRate
            usdLabelSell.text = usdRateSell
            euroLabel.text = euroRate
            euroLabelSell.text = euroRateSell
            rusLabel.text = rusRate
            rusLabelSell.text = rusRateSell
        
//        if #available(iOS 13.0, *) {
              if self.traitCollection.userInterfaceStyle == .dark {
                  usdLabel.backgroundColor = darkGreenColor
                  euroLabel.backgroundColor = darkGreenColor
                  rusLabel.backgroundColor = darkGreenColor
                  print("dark")
              } else if self.traitCollection.userInterfaceStyle == .light {
                  usdLabel.backgroundColor = lightGreenColor
                  euroLabel.backgroundColor = lightGreenColor
                  rusLabel.backgroundColor = lightGreenColor
                  print("light")
              } else {
                 print("wow")
              }
          // }
      }
        }

