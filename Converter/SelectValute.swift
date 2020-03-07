
import SwiftUI

struct SelectValute: View {
    
    private let work = Work()
    
    @State
    var valute: [Valute] = []
    @Binding
    var nominal: Int
    @Binding
    var valure: Double
    @Binding
    var isActive: Bool
    @Binding
    var name: String
    @Binding
    var valuteImage: String
    
    var body: some View {
        List(self.valute, id: \.self){ valute in
            HStack(alignment: .center){
                HStack{
                    Text(flag(country: valute.CharCode)).font(.system(size: 28))
                    VStack(alignment: .leading){
                        Text(valute.Name).font(.system(size: 14))
                        Text(valute.CharCode).foregroundColor(.gray).font(.system(size: 14))
                    }
                }.onTapGesture {
                    self.name = valute.CharCode
                    self.valure = valute.Value
                    self.nominal = valute.Nominal
                    self.valuteImage = flag(country: valute.CharCode)
                    self.isActive = false
                }
            }
        }.onAppear{
            self.work.request(request: "/scripts/XML_daily.asp"){ (response: ValCurs<[Valute]>) in
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
            }
        }
    }
}

func flag(country: String) -> String {
    let base: UInt32 = 127397
    
    var s = ""
    
    // XDR is the world currency, so let's give it a neutral flag.
    
    if (country == "XDR") {
        return "🏳️"
    }
    
    for v in country.prefix(2).unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return s
}
