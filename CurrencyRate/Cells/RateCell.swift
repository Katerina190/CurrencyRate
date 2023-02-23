//
//  RateCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 9.02.23.
//

import UIKit

final class RateCell: UITableViewCell {
    
    @IBOutlet private weak var imageViewFlag: UIImageView!
    @IBOutlet private weak var textNameLabel: UILabel!
    @IBOutlet private weak var textRateLabel: UILabel!
    
    func configure(icon: UIImage?, text: String, value: Double) {
        imageViewFlag.image = icon
        textNameLabel.text = text
        textRateLabel.text = "\(value)"
    }
}
