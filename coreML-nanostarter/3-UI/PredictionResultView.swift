//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        
            VStack{
                //This view displays your prediction. Make edits in PredictiveLabelView file.
                PredictiveLabelView(labelData: labelData)

            }

    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification())
    }
}

