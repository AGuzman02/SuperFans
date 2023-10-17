//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(labelData.label.capitalized)
                .font(.largeTitle)
            
            Text(labelData.emoji)
                .font(.system(size: 100))
                .padding(.bottom, 5)
        }
    }
}

struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: Classification())
    }
}
