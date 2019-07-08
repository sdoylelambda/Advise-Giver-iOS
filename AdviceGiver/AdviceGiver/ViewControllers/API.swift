//import Foundation
//
//
//class API {
//
//    public static let shared = API()
//
//    private init() {}
//    private let urlSession = URLSession.shared
//    private let baseURL = URL(string: "https://advice-giver.herokuapp.com/")!
//    // ADD API KEY
//    private let apiKey = "PUT API KEY HERE"
//
//    private let jsonDecoder: JSONDecoder = {
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
//        return jsonDecoder
//    }()
//    // Enum Endpoint
//    enum Endpoint: String, CustomStringConvertible, CaseIterable {
//        case nowPlaying = "now_playing"
//        case upcoming
//        case popular
//        case topRated = "top_rated"
//    }
//}
//
//
//}
