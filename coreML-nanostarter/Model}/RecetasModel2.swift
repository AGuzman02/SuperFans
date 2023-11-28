//
//  PerfilesModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

struct Recetas: Decodable {
    var arrRecetas: [RecetasModel]
    
    enum CodingKeys : String, CodingKey {
        case arrRecetas = "recetas"
    }
}

struct RecetasFav: Decodable {
    var arrFavoritas: [RecetasModel]
    
    enum CodingKeys : String, CodingKey {
        case arrFavoritas = "favoritas"
    }
}

struct RecetasCarr: Decodable {
    var arrRecetasCarr: [RecetasModel]
    
    enum CodingKeys : String, CodingKey {
        case arrRecetasCarr = "listaIngredientesPost"
    }
}

struct RecetasModel : Codable, Hashable {
    //var id = UUID()
    var idreceta: Int?
    var recetaname: String?
    var tiempo: Int?
    var calories: Int?
    var img: String?
    
    
    enum CodingKeys : String, CodingKey {
        case idreceta
        case recetaname
        case tiempo
        case calories
        case img

    }
}
