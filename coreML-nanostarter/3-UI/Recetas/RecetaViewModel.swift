import Foundation
import SwiftUI

class RecetasViewModel : ObservableObject{
    @Published var arrRecetas = [RecetasModel]()
    
    init(){
        getReceta()
    }
    
    func getReceta (){
        var receta : RecetasModel
        
        receta = RecetasModel(title: "Carbonara", description: "574kcal", URLVideo: "https://youtu.be/HRaoYuRKBaA?si=yYYPozFVDDYwm9YX", nomimg: "https://i.blogs.es/8819e1/carbonara-rec/1366_2000.jpg", numeps: 1076, isFavorite: true)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Pay de manzana", description: "237kcal", URLVideo: "https://youtu.be/4t__wczfpRI?si=WZAPceihBZcUlCMC", nomimg: "paymanzana", numeps: 500, isFavorite: false)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Pay de limon", description: "285kcal", URLVideo: "https://youtu.be/1dDvMEisEC8?si=ng-W-Ug0EwrAddkZ", nomimg: "paylimon", numeps: 23, isFavorite: false)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Licuado de platano", description: "377kcal", URLVideo: "https://youtu.be/wW9TwZdWpjw?si=5cQG3LAKX-lLAOfo", nomimg: "licplat", numeps: 13, isFavorite: false)
        arrRecetas.append(receta)
        
        receta = RecetasModel(title: "Chilaquiles", description: "486kcal", URLVideo: "https://youtu.be/AgBUP8TJqV8?si=Wz19gKkCZGt84Di6", nomimg: "chilacos", numeps: 30, isFavorite: true)
        arrRecetas.append(receta)
    }
}
