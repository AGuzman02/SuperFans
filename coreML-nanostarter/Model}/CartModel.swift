//
//  PerfilesModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

struct Cart: Decodable {
    var arrCart: [CartModel]
    
    enum CodingKeys : String, CodingKey {
        case arrCart = "cart"
    }
}

struct CartModel : Codable, Identifiable, Hashable {
    var ingrediente: String?
    
    enum CodingKeys : String, CodingKey {
        case ingrediente
    }
}
