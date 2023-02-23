//
//  BanksModel.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 12.02.23.
//

import UIKit

struct BanksModel: Codable {
    
    var bank_name: String
    var usd_buy_price: String
    var usd_sell_price: String
    var eur_buy_price: String
    var eur_sell_price: String
    var rub_buy_price: String
    var rub_sell_price: String
    
}
