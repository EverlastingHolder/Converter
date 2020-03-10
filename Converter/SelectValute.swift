
import SwiftUI

struct SelectValute: View {
    
    private let count = Count()
    
    @State
    var valute: [Valute] = []
    @Binding
    var nominal: Int
    @Binding
    var valure: Double
    @Binding
    var name: String
    @Binding
    var valuteImage: String
    @State
    var request: String = ""
    
    var body: some View {
        VStack{
            SearchBar(text: self.$request)
            List(self.valute.filter({ (value: Valute)  -> Bool in
                return value.CharCode.lowercased().starts(with: self.request.lowercased()) || value.Name.lowercased().starts(with: self.request.lowercased())
            }), id: \.self){ valute in
                HStack(alignment: .center){
                    Button(action: {
                        
                        self.name = valute.CharCode
                        self.valure = valute.Value
                        self.nominal = valute.Nominal
                        self.valuteImage = flag(country: valute.CharCode)
                        
                        SceneDelegate.sceneDelegate.window?.rootViewController?.dismiss(animated: true)
                        
                    }){
                        HStack{
                            Text(flag(country: valute.CharCode)).font(.system(size: 28))
                            VStack(alignment: .leading){
                                Text(valute.Name).font(.system(size: 14))
                                Text(valute.CharCode).foregroundColor(.gray).font(.system(size: 14))
                            }
                        }
                    }
                }
            }.onAppear{
                self.valute = Work.valute
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
