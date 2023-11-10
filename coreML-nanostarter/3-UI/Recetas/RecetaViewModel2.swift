import Foundation
import SwiftUI
        
class RecetasViewModel : ObservableObject {
    @Published var arrReceta = [RecetasModel]()
    
    func getRecetas() async throws {
        
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas")
        else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url : url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        print(data)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        let recetas = try JSONDecoder().decode(Recetas.self, from: data)
        
        print(recetas)
        
        DispatchQueue.main.async{
            self.arrReceta = recetas.arrRecetas
        }
        
        print(arrReceta)
        
    }
}
