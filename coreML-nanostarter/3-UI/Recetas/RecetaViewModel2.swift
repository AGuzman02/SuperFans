import Foundation
import SwiftUI
        
class RecetasViewModel : ObservableObject {
    @Published var arrReceta = [RecetasModel]()
    @Published var arrRecetaFav = [RecetasModel]()
    
    @Published var idPerfil = 64
    @Published var idReceta = 64

    
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
    
    func getRecetasID() async throws {
        
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/favoritas/22")
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
        
        let recetas = try JSONDecoder().decode(RecetasFav.self, from: data)
        
        print(recetas)
        
        DispatchQueue.main.async{
            self.arrRecetaFav = recetas.arrFavoritas
        }
        
        print(arrRecetaFav)
        
    }
    
    //cosa nueva
    func getRecetasConCarr() async throws {
        
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/favoritas/22")
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
        
        let recetas = try JSONDecoder().decode(RecetasFav.self, from: data)
        
        print(recetas)
        
        DispatchQueue.main.async{
            self.arrRecetaFav = recetas.arrFavoritas
        }
        
        print(arrRecetaFav)
        
    }
    
    /*func toggleFavorite(receta: RecetasModel) {
            if isFavorite(receta: receta) {
                arrRecetaFav.removeAll { $0.idreceta == receta.idreceta }
            } else {
                arrRecetaFav.append(receta)
            }
        }*/

    func isFavorite(receta: RecetasModel) -> Bool {
        return arrRecetaFav.contains { $0.idreceta == receta.idreceta }
    }
    
    ///intento de algo nuevo
    struct AddFavRequest: Encodable {
        let idPerfil: Int
        let idReceta: Int
    }
    func addRecetaFav(idPerfil:Int, idReceta:Int) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/favorita") else {
            print("Invalid URL")
            return
        }
        
        let addFavRequest = AddFavRequest(idPerfil: idPerfil, idReceta: idReceta)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(addFavRequest)

        let (_, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error añadiendo receta a favs")
            return
        }
        // La solicitud fue exitosa, puedes realizar acciones adicionales aquí si es necesario.
        print("Receta añadida a favoritos correctamente")

    }
    
    func deleteRecetaFav(idPerfil:Int, idReceta:Int) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/favorita") else {
            print("Invalid URL")
            return
        }
        
        let addFavRequest = AddFavRequest(idPerfil: idPerfil, idReceta: idReceta)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(addFavRequest)

        let (_, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error borrando receta a favs")
            return
        }
        // La solicitud fue exitosa, puedes realizar acciones adicionales aquí si es necesario.
        print("Receta borrada de favoritos correctamente")

    }
    
}


