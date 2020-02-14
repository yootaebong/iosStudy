//
//  CircleImage.swift
//  Landmarks
//
//  Created by taebong you on 2020/02/14.
//  Copyright © 2020 taebong you. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ex.png")
            .resizable()
            .clipShape(Circle())
            .frame(width: 200, height: 200, alignment: .center)
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
