import Foundation

class Model {
    static let shared = Model()
    private init() {}
    var question: Question?
    var savedQuestion: [Question] = []
    
   
    var numberOfQuestions: Int {
        return savedQuestion.count
    }
    
    func addQuestion(advice: Question) {
        savedQuestion.append(advice)
        saveToPersistence()
    }
    
    func removeQuestion(at indexPath: IndexPath) {
        savedQuestion.remove(at: indexPath.row)
        saveToPersistence()
    }
    
    func savedQuestion(at indexPath: IndexPath) -> Question {
        saveToPersistence()
        return savedQuestion[indexPath.row]
    }
    
    private func loadToPersistence() {
        do {
            let memoriesData = try Data(contentsOf: memoriesFileURL)
            let decoder = JSONDecoder()
            let decodedMemories = try decoder.decode([Question].self, from: memoriesData)
            
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
    
    var memories: [Question] = []
}
