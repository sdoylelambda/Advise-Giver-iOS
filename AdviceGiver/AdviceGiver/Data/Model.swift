import Foundation

class Model {
    static let shared = Model()
    private init() {}
    var advise: Advise?
    var savedAdvise: [Advise] = []
    
   
    var numberOfAdvise: Int {
        return savedAdvise.count
    }
    
    func addAdvise(advise: Advise) {
        savedAdvise.append(advise)
        saveToPersistence()
    }
    
    func removeAdvise(at indexPath: IndexPath) {
        savedAdvise.remove(at: indexPath.row)
        saveToPersistence()
    }
    
    func savedAdvise(at indexPath: IndexPath) -> Advise {
        saveToPersistence()
        return savedAdvise[indexPath.row]
    }
    
    private func loadToPersistence() {
        do {
            let memoriesData = try Data(contentsOf: memoriesFileURL)
            let decoder = JSONDecoder()
            let decodedMemories = try decoder.decode([Advise].self, from: memoriesData)
            
            memories = decodedMemories
        } catch {
            NSLog("Error decoding memories: \(error)")
        }
    }
    
    private func saveToPersistence() {
        let encoder = JSONEncoder()
        
        do {
            let memoriesData = try encoder.encode(memories)
            try memoriesData.write(to: memoriesFileURL)
        } catch {
            NSLog("Error encoding memories: \(error)")
        }
    }
    
    var memoriesFileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("memories.json")
    
    var memories: [Advise] = []
}
