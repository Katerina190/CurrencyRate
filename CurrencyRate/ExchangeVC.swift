//
//  ExchangeVC.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 6.02.23.
//

import UIKit
// MARK: - protocol
protocol CurrencySelectionDelegate: AnyObject {
    func didSelect(currency: Model, forType type: SelectedCurrency)
}

final class ExchangeVC: UIViewController {
        
    @IBOutlet private weak var resultFrom: UITextField!
    @IBOutlet private weak var resultTo: UITextField!
    @IBOutlet private weak var actualDateLabel: UILabel!
    @IBOutlet weak var buttonTo: UIButton!
    @IBOutlet weak var buttonFrom: UIButton!
    @IBOutlet private weak var rightButtonDone: UIBarButtonItem!
    @IBOutlet private weak var labelConvert: UILabel!
    
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
        //buttonFrom.setTitle(buttonTitle, for: .normal)
        labelConvert.text = "Convert in:"
        resultFrom.delegate = self
    }
    
    //MARK: - function for dateLabel
    
    private func updateUI() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = dateFormatter.string(from: Date())
        actualDateLabel.text = "Courses for \(formattedDate)"
        
    }
    //MARK: - function for convert money
    
     func convertMoney(amount: Double?) -> String {
        guard let fromCurrency = fromCurrency,
                let toCurrency = toCurrency,
                let amount = amount else {
            return ""
        }
         print(fromCurrency)
         print(toCurrency)
//        let d = ((Double(fromCurrency.Cur_Scale) * fromCurrency.Cur_OfficialRate) /  (Double(toCurrency.Cur_Scale) * toCurrency.Cur_OfficialRate)) * amount
         let d = ((fromCurrency.Cur_OfficialRate / Double(fromCurrency.Cur_Scale)) /  (toCurrency.Cur_OfficialRate / Double(toCurrency.Cur_Scale))) * amount
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
        buttonFrom.setTitle(fromCurrency?.Cur_Abbreviation, for: .normal)
        buttonTo.setTitle(toCurrency?.Cur_Abbreviation, for: .normal)
    }
    
    var buttonTitle: String = "" {
        didSet {
            if buttonFrom != nil {
                buttonFrom.setTitle(buttonTitle, for: .normal)
            }
            
        }
    }
    
    @IBAction private func barButtonDone(_ sender: AnyObject) {
        resultFrom.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    //MARK: - func for present ListForChoiceCurrencies view controller
    func presentListCurrencyVC(buttonType: SelectedCurrency) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let fromVC = storyboard.instantiateViewController(withIdentifier: "\(ListForChoiceCurrencies.self)") as! ListForChoiceCurrencies
            fromVC.delegate = self
            fromVC.choosenCurrency = buttonType
            navigationController?.present(fromVC, animated: true)
        
    }
    
    func clearTextFields() {
        resultTo.text = ""
        resultFrom.text = ""
    }
    
    @IBAction private func buttonFromMoney(_ sendeer: AnyObject) {
        presentListCurrencyVC(buttonType: .from)
        clearTextFields()
    }
    
    @IBAction private func buttonToMoney(_ sendeer: AnyObject) {
        presentListCurrencyVC(buttonType: .to)
        clearTextFields()
    }
        
}

    
// MARK: - extendions
extension ExchangeVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationItem.rightBarButtonItem = rightButtonDone
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == resultFrom {
            let newString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
            
            // Если новая строка пустая, очистите resultTo
            if newString?.isEmpty == true {
                resultTo.text = ""
            }
        }
        
        return true
    }
}

extension ExchangeVC: CurrencySelectionDelegate {
    func didSelect(currency: Model, forType type: SelectedCurrency) {
        if type == .from {
            fromCurrency = currency
        } else {
            toCurrency = currency
        } 
        renewButtons()
    }
}

