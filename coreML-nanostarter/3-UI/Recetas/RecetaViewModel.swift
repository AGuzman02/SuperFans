import Foundation
import SwiftUI

class RecetasViewModel : ObservableObject{
    @Published var arrRecetas = [RecetasModel]()
    
    init(){
        getReceta()
    }
    
    func getReceta (){
        var receta : RecetasModel
        
        receta = RecetasModel(title: "Carbonara", description: "100kcal", URLVideo: "https://youtu.be/HRaoYuRKBaA?si=yYYPozFVDDYwm9YX", nomimg: "carbonara", numeps: 1076, isFavorite: true)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Naruto", description: "Ninja anime", URLVideo: "https://youtu.be/4t__wczfpRI?si=WZAPceihBZcUlCMC", nomimg: "narutoimg", numeps: 500, isFavorite: false)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Jujutsu Kaisen", description: "Sorcerers anime", URLVideo: "https://youtu.be/1dDvMEisEC8?si=ng-W-Ug0EwrAddkZ", nomimg: "jjkimg", numeps: 23, isFavorite: false)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Bleach", description: "Swordmans anime", URLVideo: "https://youtu.be/wW9TwZdWpjw?si=5cQG3LAKX-lLAOfo", nomimg: "bleachimg", numeps: 13, isFavorite: false)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Attack On Titan", description: "Mecha anime", URLVideo: "https://youtu.be/AgBUP8TJqV8?si=Wz19gKkCZGt84Di6", nomimg: "aotimg", numeps: 30, isFavorite: true)
        arrRecetas.append(receta)
    }
}
