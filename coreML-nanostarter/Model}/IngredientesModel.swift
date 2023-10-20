//
//  PerfilesModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

struct ResponseData: Decodable {
    var ingredientes: [IngredientesModel]
}

struct IngredientesModel : Decodable, Identifiable {
    var ingredienteid: Int
    var ingrediente: String
    
    
    enum CodingKeys : String, CodingKey {
        case ingredienteid
        case ingrediente

    }
    
    var id: Int {
            return ingredienteid
        }
}

/*struct ChistesModel : Decodable {
    var jokes: [JokeModel]
    
}*/
