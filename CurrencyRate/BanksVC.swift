//
//  BanksVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 12.02.23.
//

import UIKit


final class BanksVC: UIViewController {
    
    private var banks : [BanksModel] = []
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "BankCell", bundle: nil)
        
        tableView.register(nibCell, forCellReuseIdentifier: "BankCell")
        tableView.dataSource = self
        searchBarBanks.delegate = self
       
        loadBank()
//        networkService.loadBanks { banks in
//            self.banks = banks
//            self.tableView.reloadData()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBank()
    }
    func loadBank() {
        networkService.loadBanks { banks in
            self.banks = banks
            self.tableView.reloadData()
        }
    }
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBarBanks: UISearchBar!
    
    @IBAction private func barBankItem () {
       loadBank()
    }
}

extension BanksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(BankCell.self)", for: indexPath) as? BankCell
        let post = banks[indexPath.row]
        cell?.setup(bankName: post.bank_name, usdRate: post.usd_buy_price, usdRateSell: post.usd_sell_price, euroRate: post.eur_buy_price, euroRateSell: post.eur_sell_price, rusRate: post.rub_buy_price, rusRateSell: post.rub_sell_price)
        cell?.config(usd: "USD", eur: "EUR", rub: "RUB")
        return cell ?? UITableViewCell()
    }

}

extension BanksVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
           loadBank()
        } else {
                networkService.loadBanks { banks in
                    self.banks = banks.filter {
                        $0.bank_name.lowercased().contains(searchText.lowercased()) }
                    self.tableView.reloadData()
                }
            }
        }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBarBanks.resignFirstResponder()
            searchBarBanks.text = ""
        }

    }


 
