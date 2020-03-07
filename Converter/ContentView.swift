import SwiftUI

struct ContentView: View {
    
    private let count = Count()
    
    @State
    var act: Bool = false
    @State
    var isActive: Bool = false
    @State
    var firstValue: Double = 67
    @State
    var secondValue: Double = 44
    @State
    var nominalFirstValue: Int = 1
    @State
    var nominalSecondValue: Int = 1
    @State
    var firstValute: String = ""
    @State
    var secondValute: String = ""
    @State
    var textFirstValute: String = "0"
    @State
    var textSecondValute: String = "0"
    @State
    var nameValuteFirst: String = "AUD"
    @State
    var nameValuteSecond: String = "USD"
    
    var body: some View {
        
        ZStack{
            
            HStack{
                //Valute 1
                VStack{
                    
                    HStack{
                        Button(action: {
                            self.isActive = true
                        }){
                            Text(self.textFirstValute).font(.system(size: 36))
                        }
                        Text(self.nameValuteFirst)
                    }
                        
                    .sheet(isPresented: self.$isActive, content: {
                        SelectValute(
                            nominal: self.$nominalFirstValue,
                            valure: self.$firstValue,
                            isActive: self.$isActive,
                            name: self.$nameValuteFirst,
                            valuteImage: self.$textFirstValute)
                    })
                    
                    TextField("0", text:  Binding(get: {
                        
                         self.firstValute
                        
                    }, set:{
                        
                        self.firstValute = $0
                        
                        self.secondValute = self.count.firstCount(
                            nominalFirstValue: self.nominalFirstValue,
                            secondValue: self.secondValue,
                            firstValue: self.firstValue,
                            firstValute: self.firstValute,
                            nominalSecondValue: self.nominalSecondValue)
                        
                    }))
                        .keyboardType(.numberPad)
                        .font(.system(size: 28))
                        .multilineTextAlignment(.center)
                }.padding(.horizontal, 28)
                Text("=").foregroundColor(.gray).font(.system(size: 90))
                //Valute 2
                VStack{
                    
                    HStack{
                        Text(self.nameValuteSecond)
                        Button(action: {
                            self.act = true
                        }){
                            Text(self.textSecondValute).font(.system(size: 36))
                        }
                    }
                    
                    .sheet(isPresented: self.$act, content: {
                        SelectValute(
                            nominal: self.$nominalSecondValue,
                            valure: self.$secondValue,
                            isActive: self.$act,
                            name: self.$nameValuteSecond,
                            valuteImage: self.$textSecondValute)
                    })
                    
                    TextField("0",text: Binding(get: {
                        
                        self.secondValute
                        
                    }, set: {
                        
                        self.secondValute = $0
                        
                        self.firstValute = self.count.secondCount(
                            nominalFirstValue: self.nominalFirstValue,
                            secondValue: self.secondValue,
                            firstValue: self.firstValue,
                            secondValute: self.secondValute,
                            nominalSecondValue: self.nominalSecondValue)
                        
                    }))
                        .keyboardType(.numberPad)
                        .font(.system(size: 28))
                        .multilineTextAlignment(.center)
                    
                }.padding(.horizontal, 28)
            }
        }.onAppear{
            self.textSecondValute = UserDefaults.standard.string(forKey: "AUDCharCode") ?? "AUD"
            self.textFirstValute = UserDefaults.standard.string(forKey: "USDCharCode") ?? "USD"
            self.firstValue = UserDefaults.standard.double(forKey: "USDValue")
            self.secondValue = UserDefaults.standard.double(forKey: "AUDValue")
            self.nominalFirstValue = UserDefaults.standard.integer(forKey: "USDValue")
            self.nominalSecondValue = UserDefaults.standard.integer(forKey: "AUDValue")
            self.nameValuteSecond = UserDefaults.standard.string(forKey: "AUDCharCodeImage") ?? "🇦🇺"
            self.nameValuteFirst = UserDefaults.standard.string(forKey: "USDCharCodeImage") ?? "🇱🇷"
        }
    }
}

struct Valute: Codable,Hashable{
    let NumCode: Int
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let ID: String
}

struct ValCurs<T: Codable>: Codable {
    let Date: String
    let name: String
    let Valute: T
}
