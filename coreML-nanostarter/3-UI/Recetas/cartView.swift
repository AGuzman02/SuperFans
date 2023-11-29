//
//  cartView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 07/11/23.
//

import SwiftUI

struct cartView: View {
    
    @EnvironmentObject var cartVM: cartViewModel

    var body: some View {
        VStack {
            List {
                ForEach(Array(zip(cartVM.arrCart, cartVM.arrVid)), id: \.0)
                { item, item2 in
                    HStack {
                        NavigationLink(destination: YoutubeView(videoID: item2)){
                            Image(systemName: "play.fill")
                        }.frame(width: 20)
                                                
                        Text(item)
                        
                        Spacer()
                        
                        Button("Borrar"){
                            if let index = cartVM.arrCart.firstIndex(of: item){
                                cartVM.arrCart.remove(at: index)
                                cartVM.arrVid.remove(at: index)
                            }
                        }
                    }.buttonStyle(BorderlessButtonStyle())
                }
            }
        }.navigationTitle("Carrito")
    }
}

struct cartView_Previews: PreviewProvider {
    static var previews: some View {
        cartView()
            .environmentObject(cartViewModel())
    }
}
