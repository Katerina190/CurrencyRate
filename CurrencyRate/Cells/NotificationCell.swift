//
//  NotificationCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 1.03.23.
//

import UIKit

final class NotificationCell: UITableViewCell {
    @IBOutlet private weak var labelNotification: UILabel!
    
    func configure(label: String) {
        labelNotification.text = label
    }
}
