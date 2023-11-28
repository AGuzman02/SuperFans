//
//  Receta.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct ar: View {
    
    let receta: RecetasModel
    @EnvironmentObject var recetaVM : RecetasViewModel
    
    var body: some View {
                        
                    
                    
                    
                VStack(alignment: .trailing){
                       
                    Text(receta.calories ?? 0).padding(.bottom,5)
                        
            }
            
        }
    }
