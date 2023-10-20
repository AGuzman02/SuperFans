import Foundation
import SwiftUI
        
class UsersViewModel : ObservableObject {
    @Published var arrUsers = [UserModel]()
    
    func getUsers() async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode(UsersModel.self, from: data)
        print(results)
        DispatchQueue.main.async{
            self.arrUsers = results.users
                            
        }
        
        
    }
}
