//
//  Model.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 5.02.23.
//

import Foundation
import UIKit

struct Model: Codable {
    var Cur_ID: Int
    var Date: String
    var Cur_Abbreviation: String
    var Cur_Scale: Int
    var Cur_Name: String
    var Cur_OfficialRate: Double
}



