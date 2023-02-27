//
//  ExchangeVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 6.02.23.
//

import UIKit

final class ExchangeVC: UIViewController {
    
  // var myCV = ListForChoiceCurrencies()
    
    @IBOutlet private weak var resultFrom: UITextField!
    @IBOutlet private weak var resultTo: UITextField!
    @IBOutlet private weak var actualDateLabel: UILabel!
    @IBOutlet weak var buttonTo: UIButton!
    @IBOutlet weak var buttonFrom: UIButton!
    @IBOutlet private weak var rightButtonDone: UIBarButtonItem!
    
    private var model: Model?
    private var networkService = NetworkService()
    
    var toCurrency: Model?
    var fromCurrency: Model?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadPosts { [weak self] models in
            self?.model = models.first
            self!.toCurrency  = models.first
            self!.fromCurrency = models[8]
            self!.updateUI()
            self!.renewButtons()
        }
        resultFrom.delegate = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
////        renewButtons()
//    }
    
    //MARK: - function for dateLabel
    
    private func updateUI() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = dateFormatter.string(from: Date())
        actualDateLabel.text = "Курсы за \(formattedDate)"
        
//        let inputDateFormatter = DateFormatter()
//        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//
//        let outputDateFormatter = DateFormatter()
//        outputDateFormatter.dateFormat = "dd.MM.yyyy"
//
//        if let date = inputDateFormatter.date(from: model.Date) {
//            let formattedDate = outputDateFormatter.string(from: date)
//
//            actualDateLabel.text = "Курсы за \(formattedDate)"
//        }
    }
    //MARK: - function for convert money
    
     func convertMoney(amount: Double?) -> String {
        guard let fromCurrency = fromCurrency,
                let toCurrency = toCurrency,
                let amount = amount else {
            return ""
        }
        let d = ((Double(fromCurrency.Cur_Scale) * fromCurrency.Cur_OfficialRate) /  (Double(toCurrency.Cur_Scale) * toCurrency.Cur_OfficialRate)) * amount
        return String(d)

    }
    
    @IBAction private func textFieldFromConvert() {
            let amount = Double(resultFrom.text!)
            if amount != nil {
            resultTo.text = convertMoney(amount: amount)
                print("succesfull")
        }
    }
    
    //MARK: - function for buttons
    
    func renewButtons() {
        buttonFrom.setTitle(fromCurrency?.Cur_Abbreviation, for: UIControl.State.normal)
        buttonTo.setTitle(toCurrency?.Cur_Abbreviation, for: UIControl.State.normal)
    }
    
    @IBAction private func barButtonDone(_ sender: AnyObject) {
        resultFrom.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    func presentListCurrencyVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fromVC = storyboard.instantiateViewController(withIdentifier: "\(ListForChoiceCurrencies.self)")
        navigationController?.present(fromVC, animated: true)
    }
    
    
    
    @IBAction private func buttonFromMoney(_ sendeer: AnyObject) {
       presentListCurrencyVC()
       // myCV.choosenCurrency = .from
        
    }
    @IBAction private func buttonToMoney(_ sendeer: AnyObject) {
      // myCV.choosenCurrency = .to
    }
        
}
    
extension ExchangeVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationItem.rightBarButtonItem = rightButtonDone
        return true
    }
}


