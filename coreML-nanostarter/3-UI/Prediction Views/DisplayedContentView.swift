//
//  DisplayedContentView.swift
//  coreML-starter
//

import SwiftUI

struct DisplayedContentView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        
        
        HStack {
            Text(labelData.details)
                .multilineTextAlignment(.center)
        }
        .padding(15)
        
    }
}

struct DisplayedContentView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayedContentView(labelData: Classification())
    }
}
