import Foundation

class Model {
    static let shared = Model()
    private init() {}
    var advise: Advise?
    var savedAdvise: [Advise] = []
}

