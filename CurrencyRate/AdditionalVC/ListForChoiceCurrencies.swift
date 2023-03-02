//
//  ListForChoiceCurrencies.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 27.02.23.
//

import UIKit

enum SelectedCurrency {
    case from
    case to
}

final class ListForChoiceCurrencies: UIViewController {
    var myVC = ExchangeVC()
    var mySecondVC = CoursesVC()
    var currencies: [Model]  = []
    private var networkService = NetworkService()
    
    
    weak var delegate: CurrencySelectionDelegate?
    
        
    var choosenCurrency: SelectedCurrency = .from
    
    @IBOutlet private weak var tableViewCurrencies: UITableView! {
        didSet {
            tableViewCurrencies.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCurrencies.delegate = self
        
        networkService.loadPosts { currencies in
            self.currencies = currencies
            DispatchQueue.main.async {
                self.tableViewCurrencies.reloadData()
                
            }
        }
    }
    
    @IBAction private func didTapCancel(_ sender: AnyObject) {
        dismiss(animated: true)
    }
    
    
 
}




extension ListForChoiceCurrencies: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(currencies)
        return currencies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellForChooseCurrency.self)", for: indexPath) as? CellForChooseCurrency
        let currency = currencies[indexPath.row]
        cell?.config(label: currency.Cur_Name)
        return cell ?? UITableViewCell()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCurrency = currencies[indexPath.row]
           delegate?.didSelect(currency: selectedCurrency, forType: choosenCurrency)
           dismiss(animated: true, completion: nil)
        }
        
    }

