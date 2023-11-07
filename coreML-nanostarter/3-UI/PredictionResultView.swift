//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    
    var body: some View {
        
            VStack{
                
                PredictiveLabelView(labelData: labelData)
                
            }

    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification()).environmentObject(cartViewModel())
    }
}

