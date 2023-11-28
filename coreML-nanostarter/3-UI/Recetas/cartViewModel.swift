//
//  cartViewModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 07/11/23.
//

import Foundation

class cartViewModel: ObservableObject{
    @Published var arrCart: [String]
    @Published var arrVid: [String]
    @Published var arrRecetaCarr = [RecetasModel]()
    @Published var arrRecetaFav = [RecetasModel]()

    
    
    
    init(){
        self.arrCart = []
        self.arrVid = []
    }
    
    func addIng(_ newIng: String)   {
        if !arrCart.contains(newIng){
            arrCart.append(newIng)
        }
        if arrCart.contains(newIng){
            arrCart.removeAll { $0 == newIng }
            arrCart.append(newIng)
        }
    }
    
    func addVid(_ newVid: String)   {
        if !arrVid.contains(newVid){
            arrVid.append(newVid)
        }
        if arrVid.contains(newVid){
            arrVid.removeAll { $0 == newVid }
            arrVid.append(newVid)
        }
    }
    
    func sendCarrito() async {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/listaingredientes") else {
            print("URL inválida")
            return
        }

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: arrCart)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData

            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            //let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print(data)

            /*guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error al enviar el carrito al endpoint")
                print(response)
                return
            }*/
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("error al enviar carrito")
                return
            }

            print("Carrito enviado exitosamente")
            
            let ingredientesRec = try JSONDecoder().decode(RecetasCarr.self, from: data)
            
            print(ingredientesRec)
            
            DispatchQueue.main.async{
                self.arrRecetaCarr = ingredientesRec.arrRecetasCarr
            }
            
            print(arrRecetaCarr)
            
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    
    ///lo nuevoo intento
    func isFavorite2(receta: RecetasModel) -> Bool {
        return arrRecetaFav.contains { $0.idreceta == receta.idreceta }
    }
    
    ///intento de algo nuevo
    struct AddFavRequest2: Encodable {
        let idPerfil: Int
        let idReceta: Int
    }
    func addRecetaFav2(idPerfil:Int, idReceta:Int) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/favorita") else {
            print("Invalid URL")
            return
        }
        
        let addFavRequest = AddFavRequest2(idPerfil: idPerfil, idReceta: idReceta)

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
    
    func deleteRecetaFav2(idPerfil:Int, idReceta:Int) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/favorita") else {
            print("Invalid URL")
            return
        }
        
        let addFavRequest = AddFavRequest2(idPerfil: idPerfil, idReceta: idReceta)

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
