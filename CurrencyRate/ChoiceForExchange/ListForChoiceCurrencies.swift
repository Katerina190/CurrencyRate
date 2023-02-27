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
    
    var choosenCurrency: SelectedCurrency = .from
    @IBOutlet private weak var tableViewCurrencies: UITableView! {
        didSet {
            tableViewCurrencies.dataSource = self
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "changetitlebuttons" {
//            let destinationVC = segue.destination as! ExchangeVC
//            myVC = destinationVC
//        }
//    }
    
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let currency = currencies[indexPath.row]
//        if choosenCurrency == .from {
//            myVC.fromCurrency = currency
//            myVC.buttonFrom.setTitle("OCHKO", for: UIControl.State.normal)
//        }
//        if choosenCurrency == .to {
//            myVC.toCurrency = currency
//        }
//        myVC.renewButtons()
//        print(myVC.fromCurrency)
//        print(myVC.toCurrency)
//        myVC.buttonFrom.setTitle(fromCurrency?.Cur_Abbreviation, for: UIControl.State.normal)
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedCurrency = currencies[indexPath.row]
//        if choosenCurrency == .from {
//            myVC.fromCurrency = selectedCurrency
//        }
//        if choosenCurrency == .to {
//            myVC.toCurrency = selectedCurrency
//        }
//
//        
//         }
    
    

