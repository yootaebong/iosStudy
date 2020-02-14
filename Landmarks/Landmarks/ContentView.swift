//
//  ContentView.swift
//  Landmarks
//
//  Created by taebong you on 2020/02/14.
//  Copyright © 2020 taebong you. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                MapView()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                CircleImage()
                    .offset(x:90, y : -130)
                    .padding(.bottom,-130)
                    
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Bongs Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("Korea")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
