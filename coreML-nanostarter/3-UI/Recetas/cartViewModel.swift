//
//  cartViewModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 07/11/23.
//

import Foundation

class cartViewModel: ObservableObject{
    @Published var arrCart: [String]
    
    init(){
        self.arrCart = []
    }
    
    func addIng(_ newIng: String)   {
        if !arrCart.contains(newIng){
            arrCart.append(newIng)
        }
    }
}
