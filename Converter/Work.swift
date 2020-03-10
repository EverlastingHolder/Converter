import Foundation
import Alamofire
import XMLParsing

class Work{
    
    private let decoder = XMLDecoder()
    
    public static var valute: [Valute] = []
    
    func request<T: Codable>(request: String, paramentrs: [String: Any]? = nil, headers: HTTPHeaders? = nil, handler: @escaping (T) -> [Valute]){
        AF.request("http://www.cbr.ru"+request).response{ response in
            if let error = response.error{
                print("Error: \(error)")
            }else{
                let data = Data(response.data!)
                Work.valute = handler( try! self.decoder.decode(T.self, from: data))
            }
        }
    }
}
