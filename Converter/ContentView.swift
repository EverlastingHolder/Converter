import SwiftUI

struct ContentView: View {
    
    private let count = Count()
    private let responseResult = ResponseResult()
    
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
    var textFirstValute: String = ""
    @State
    var textSecondValute: String = ""
    @State
    var nameValuteFirst: String = ""
    @State
    var nameValuteSecond: String = ""
    @State
    var text: String = ""
    
    var body: some View {
        
        ZStack{
            HStack{
                //Valute 1
                VStack{
                    HStack{
                        Button(action: {
                            
                            let hostingController = UIHostingController(rootView: SelectValute(
                                    nominal: self.$nominalFirstValue,
                                    valure: self.$firstValue,
                                    name: self.$nameValuteFirst,
                                    valuteImage: self.$textFirstValute))

                            SceneDelegate.sceneDelegate.window?.rootViewController?.present(hostingController, animated: true)
                            
                        }){
                            Text(self.textFirstValute).font(.system(size: 46))
                        }
                        Text(self.nameValuteFirst)
                    }
                    
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

                            let hostingController = UIHostingController(rootView: SelectValute(
                                nominal: self.$nominalSecondValue,
                                valure: self.$secondValue,
                                name: self.$nameValuteSecond,
                                valuteImage: self.$textSecondValute))
                            
                            SceneDelegate.sceneDelegate.window?.rootViewController?.present(hostingController, animated: true)
                            
                        }){
                            Text(self.textSecondValute).font(.system(size: 46))
                        }
                    }
                    
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
            //Flags
            //First = USD Second = AUD
            self.textSecondValute = self.responseResult.getCharCodeImage().0
            self.textFirstValute = self.responseResult.getCharCodeImage().1
            
            //Value
            self.secondValue = self.responseResult.getValue().0
            self.firstValue = self.responseResult.getValue().1
            
            //Nominal
            self.nominalSecondValue = self.responseResult.getNominal().0
            self.nominalFirstValue = self.responseResult.getNominal().1
            
            //CharCode
            self.nameValuteSecond = self.responseResult.getCharCode().0
            self.nameValuteFirst = self.responseResult.getCharCode().1
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
