//
//  SearchView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct RecetasView: View {
    
    
    @EnvironmentObject var recetaViewModel : RecetasViewModel
    /*
    var favoriteRecetas : [RecetasModel]{
        recetaViewModel.arrReceta.filter { receta in
            (receta.isFavorite)
        }
    }
     */
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    /*
                    ForEach(favoriteRecetas, id: \.self){
                        item in
                        Receta(receta: item)
                     
                    }
                     */
                }
                .navigationTitle("Favoritos")
            }
        }
    }
}

struct RecetasView_Previews: PreviewProvider {
    static var previews: some View {
        RecetasView()
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone 14 Pro Max")
        
        RecetasView()
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}
