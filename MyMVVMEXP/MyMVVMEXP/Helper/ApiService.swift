//
//  ApiService.swift
//  MyMVVMEXP
//
//  Created by Abhik Das on 07/12/21.
//

import Foundation
class ApiService : NSObject{
    private let sourceUrl = URL(string: "http://restapi.adequateshop.com/api/authaccount/login")!
   func apiToLogin(userName:String!,password:String!){
        
        var request = URLRequest(url: sourceUrl)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "username": "\(userName!)",
            "password": "\(password!)"
        ]
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
