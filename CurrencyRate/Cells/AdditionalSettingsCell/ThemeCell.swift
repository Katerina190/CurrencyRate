//
//  ThemeCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 1.03.23.
//

import UIKit

final class ThemeCell: UITableViewCell {
    
    @IBOutlet private weak var themeLabel: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    func configure(name: String, image: UIImage) {
        themeLabel.text = name
        img.image = image
    }
}
