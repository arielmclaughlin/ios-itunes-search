import Foundation

//After we search for our person
struct Person: Codable {
    var name: String
    var gender: String
    var birthYear: String
    
}

//The topmost level. Array of information from the person we searched in the API.

struct PersonSearchResults: Codable {
    var results: [Person]
}
