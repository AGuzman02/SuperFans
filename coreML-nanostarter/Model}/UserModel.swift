import Foundation

struct UserModel : Decodable, Identifiable {
    var id: Int
    var username: String
    var password: String
    
    enum CodingKeys : String, CodingKey {
        case username
        case password = "pass"
        case id = "iduser"
    }
}

struct UsersModel : Decodable {
    var users: [UserModel]
}

extension UserModel {
    public static var defaultUsers = [UserModel(id: 1, username: "Erick22", password: "123")]

}
