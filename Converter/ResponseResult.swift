//
//  ResponseResult.swift
//  Converter
//
//  Created by admin on 10.03.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class ResponseResult{
    
    private var valute: [Valute] = []
    private let work = Work()
     
    func response (){
        
        work.request(request: "/scripts/XML_daily.asp"){ (response: ValCurs<[Valute]>) in
            self.valute = response.Valute
            for valute in self.valute {

                UserDefaults.standard.string(forKey: "\(valute.CharCode)CharCode")
                UserDefaults.standard.integer(forKey: "\(valute.CharCode)Nominal")
                UserDefaults.standard.double(forKey: "\(valute.CharCode)Value")
                UserDefaults.standard.string(forKey: "\(valute.CharCode)CharCodeImage")

                UserDefaults.standard.set(flag(country: valute.CharCode) ,forKey: "\(valute.CharCode)CharCodeImage")
                UserDefaults.standard.set(valute.Nominal, forKey: "\(valute.CharCode)Nominal")
                UserDefaults.standard.set(valute.Value, forKey: "\(valute.CharCode)Value")
                UserDefaults.standard.set(valute.CharCode, forKey: "\(valute.CharCode)CharCode")
            }
            return self.valute
        }
    }
}
