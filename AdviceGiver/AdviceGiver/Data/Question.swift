import Foundation

struct Question: Codable {
    
    let announcements: [String];
    let appointments: String;
    let id: Int;
    let myQs: [Type2];
    let newQ: [Type];
    
}

struct Type: Codable {
    let type: String
}


struct Type2: Codable {
    let type: String
}
