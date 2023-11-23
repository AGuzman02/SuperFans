//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    @EnvironmentObject var cartVM : cartViewModel

        
    var body: some View {
        
            VStack{
                
                PredictiveLabelView(labelData: labelData).environmentObject(cartVM)
                
            }

    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification()).environmentObject(cartViewModel())
    }
}

