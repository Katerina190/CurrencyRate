//
//  ContactUsCell.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 1.03.23.
//

import UIKit

final class ContactUsCell: UITableViewCell {
    
    @IBOutlet private weak var labelContact: UILabel!
    
    func configure(contact: String) {
        labelContact.text = contact
    }
}
