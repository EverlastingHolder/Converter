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
    
    func getCharCodeImage() -> (String,String) {
        (UserDefaults.standard.string(forKey: "AUDCharCodeImage") ?? "🇦🇺" , UserDefaults.standard.string(forKey: "USDCharCodeImage") ?? "🇱🇷")
    }
    
    func getValue() -> (Double,Double) {
        (UserDefaults.standard.double(forKey: "AUDValue"), UserDefaults.standard.double(forKey: "USDValue"))
    }
    
    func getNominal() -> (Int, Int) {
        (UserDefaults.standard.integer(forKey: "AUDNominal"), UserDefaults.standard.integer(forKey: "USDNominal"))
    }
    
    func getCharCode() -> (String, String) {
        (UserDefaults.standard.string(forKey: "AUDCharCode") ?? "AUD", UserDefaults.standard.string(forKey: "USDCharCode") ?? "USD")
    }
}
