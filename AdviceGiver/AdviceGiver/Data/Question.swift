import Foundation

struct Question: Codable {
    
    let announcements: [String];
    let appointments: String;
    let id: Int;
    let myQs: [Questions];
    let newQ: [Type2];
    
}

struct Questions: Codable {
    let type: String
}


struct Type2: Codable {
    let type: String
}
