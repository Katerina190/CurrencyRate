//
//  CellForChooseCurrency.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 27.02.23.
//

import UIKit

final class CellForChooseCurrency: UITableViewCell {
    @IBOutlet private weak var labelCurrency: UILabel!
    
    func config(label: String) {
        labelCurrency.text = "\(label)"
    }
}
