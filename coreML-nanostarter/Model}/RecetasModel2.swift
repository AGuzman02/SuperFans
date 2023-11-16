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

struct RecetasModel : Codable, Hashable {
    //var id = UUID()
    var idreceta: Int?
    var recetaname: String?
    var tiempo: Int?
    var img: String?
    
    
    enum CodingKeys : String, CodingKey {
        case idreceta
        case recetaname
        case tiempo
        case img

    }
}
