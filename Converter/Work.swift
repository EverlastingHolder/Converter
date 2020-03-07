import Foundation
import Alamofire
import XMLParsing

class Work{
    
    private let decoder = XMLDecoder()
    
    func request<T: Codable>(request: String, paramentrs: [String: Any]? = nil, headers: HTTPHeaders? = nil, handler: @escaping (T) -> Void){
        AF.request("http://www.cbr.ru"+request).response{ respone in
            let data = Data(respone.data!)
            handler( try! self.decoder.decode(T.self, from: data))
        }
    }
}
