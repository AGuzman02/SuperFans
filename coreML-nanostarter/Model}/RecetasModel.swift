//
//  RecetasModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import Foundation

struct RecetasModel : Identifiable, Equatable, Hashable{
    var id = UUID()
    var title: String
    var description: String
    var URLVideo: String
    var nomimg: String
    var numeps: Int
    var isFavorite: Bool
}

extension RecetasModel {
    public static var defaultReceta = RecetasModel(title: "Carbonara", description: "100kcal", URLVideo: "https://youtu.be/HRaoYuRKBaA?si=yYYPozFVDDYwm9YX", nomimg: "https://i.blogs.es/8819e1/carbonara-rec/1366_2000.jpg", numeps: 1076, isFavorite: true)
}
