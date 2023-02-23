//
//  ExchangeVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 6.02.23.
//

import UIKit

final class ExchangeVC: UIViewController {
    
    @IBOutlet private weak var resultFrom: UITextField!
    @IBOutlet private weak var resultTo: UITextField!
    @IBOutlet private weak var actualDateLabel: UILabel!
    @IBOutlet private weak var buttonTo: UIButton!
    @IBOutlet private weak var buttonFrom: UIButton!
    
    
    private var model: Model?
    private var networkService = NetworkService()
    
    var toCurrency: Model?
    var fromCurrency: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkService.loadPosts { [weak self] models in
            self?.model = models.first
            self!.toCurrency  = models.first
            self!.fromCurrency = models.last
            self?.updateUI()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        renewButtons()
    }
    
   
    
    //MARK: - function for dateLabel
    
    private func updateUI() {
        if let model = model {
            let inputDateFormatter = DateFormatter()
            inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "Курсы за: dd.MM.yyyy"
            
            if let date = inputDateFormatter.date(from: model.Date) {
                let formattedDate = outputDateFormatter.string(from: date)
                actualDateLabel.text = formattedDate
            }
        }
    }
    //MARK: - function for convert money
    
//    private func convertMoney(amount: Double?) -> String {
//        if amount == nil  {
//            return ""
//        }
//
//        let d = ((fromCurrency!.Cur_Scale_Double! * fromCurrency!.Cur_OfficialRate) /  (toCurrency!.Cur_Scale_Double! * toCurrency!.Cur_OfficialRate)) * amount!
//        return String(d)
//    }
    
    private func convertMoney(amount: Double?) -> String {
        print("jgejrr\(fromCurrency)")
       print("ger\(toCurrency)")
        guard let fromCurrency = fromCurrency,
                let toCurrency = toCurrency,
                let amount = amount else {
            return ""
        }
        let d = ((Double(fromCurrency.Cur_Scale) * fromCurrency.Cur_OfficialRate) /  (Double(toCurrency.Cur_Scale) * toCurrency.Cur_OfficialRate)) * amount
        return String(d)
        print(amount)
    }
    
    //MARK: - function for buttons
    
    func renewButtons() {
        buttonFrom.setTitle(fromCurrency?.Cur_Abbreviation, for: UIControl.State.normal)
        buttonTo.setTitle(toCurrency?.Cur_Abbreviation, for: UIControl.State.normal)
    }
    

    @IBAction private func textFieldFromConvert() {
            let amount = Double(resultFrom.text!)
            if amount != nil {
            resultTo.text = convertMoney(amount: amount)
                print("succesfull")
        }
        
    }
    
    
    @IBAction private func textFieldToConvert() {
        
    }
    
    
    @IBAction private func buttonFromMoney(_ sendeer: AnyObject) {
        
    }
    @IBAction private func buttonToMoney(_ sendeer: AnyObject) {
        
    }
        
        
    }
    



