//
//  ListForChoiceCurrencies.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 27.02.23.
//

import UIKit

final class ListForChoiceCurrencies: UIViewController {
    var currencies: [Model]  = []
    private var networkService = NetworkService()
    
    @IBOutlet private weak var tableViewCurrencies: UITableView!
    
    
}

extension ListForChoiceCurrencies: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currency = currencies[indexPath.row]
        cell.textLabel?.text = currency.Cur_Name
        return cell ?? UITableViewCell()
    }
    
    
}
