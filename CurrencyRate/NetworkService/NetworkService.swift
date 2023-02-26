//
//  NetworkService.swift
//  CurrencyRate
//
//  Created by Ekaterina Sedova on 5.02.23.
//

import Foundation

final class NetworkService {
    
    func loadPosts(completion: @escaping ([Model]) -> Void) {
        guard let url = URL(string: "https://www.nbrb.by/api/exrates/rates?periodicity=0")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
//            print(responseData)
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                var posts = try? JSONDecoder().decode([Model].self, from: jsonData)
        //MARK: - new byn
                let belarusianRuble = Model(Cur_ID: 0, Date: "", Cur_Abbreviation: "BYN", Cur_Scale: 1, Cur_Name: "Белорусский рубль", Cur_OfficialRate: 1.0)
                posts?.insert(belarusianRuble, at: 0)
                
                //let posts = try? JSONDecoder().decode([Model].self, from: jsonData)
                
                DispatchQueue.main.async {
                    completion(posts ?? [])
                }
            }
        }.resume()
    }
    
    
    func loadBanks(completion: @escaping ([BanksModel]) -> Void) {
        guard let url = URL(string: "http://185.206.212.132:8000/api/v1/exchange_rates/")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let banks = try? JSONDecoder().decode([BanksModel].self, from: jsonData)
                DispatchQueue.main.async {
                    completion(banks ?? [])
                }
            }
        }.resume()
    }
    
}
