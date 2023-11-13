//
//  cartViewModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 07/11/23.
//

import Foundation

class cartViewModel: ObservableObject{
    @Published var arrCart: [String]
    @Published var arrVid: [String]
    
    init(){
        self.arrCart = []
        self.arrVid = []
    }
    
    func addIng(_ newIng: String)   {
        if !arrCart.contains(newIng){
            arrCart.append(newIng)
        }
        if arrCart.contains(newIng){
            arrCart.removeAll { $0 == newIng }
            arrCart.append(newIng)
        }
    }
    
    func addVid(_ newVid: String)   {
        if !arrVid.contains(newVid){
            arrVid.append(newVid)
        }
        if arrVid.contains(newVid){
            arrVid.removeAll { $0 == newVid }
            arrVid.append(newVid)
        }
    }
}
