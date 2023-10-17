//
//  AboutView.swift
//  coreML-starter
//
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        ZStack {

            //[OPTIONAL] Edit background color here.
            Color(hex: 0xD5F4FF, opacity: 1.0)
                .ignoresSafeArea()

            VStack{

                // title
                Text("Credits & Our Team")
                    .font(.largeTitle) // Font type
                    .fontWeight(.bold) // Bold text
                    .foregroundColor(.indigo)  // Font color
                    .padding()

                // Teammate images row
                HStack{
                    // Teammate #1
                    VStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                        Text("My awesome teammate #1! They are great to work with.")
                            .font(.system(size: 14)) // Font size
                            .foregroundColor(.indigo) // Font color
                    }
                    .frame(maxWidth: 300)
                    .padding()

                    // Teammate #2 (copy this block for additional teammates!)
                    VStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                        Text("My awesome teammate #2! They have interesting hobbies.")
                            .font(.system(size: 14)) // Font size
                            .foregroundColor(.indigo) // Font color
                    }
                    .frame(maxWidth: 300)
                    .padding()

                }

                // About the app and team
                Text("Add some info about who created the app!")
                    .padding()

                Spacer() // space after the description
            }
            .padding()
            .background(Color.white) // This sets the background color of the card
            .cornerRadius(25)
            .shadow(radius: 5)
            .padding(.bottom, 100) // adds space at the bottom of the screen
        }
    }
}
