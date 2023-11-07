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
                ForEach(cartVM.arrCart, id: \.self)
                { item in
                    Text(item)
                }
            }
        }
    }
}

struct cartView_Previews: PreviewProvider {
    static var previews: some View {
        cartView()
            .environmentObject(cartViewModel())
    }
}
