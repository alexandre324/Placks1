//
//  SwiftUIView.swift
//  Placks
//
//  Created by Alexandre Marchal on 07/07/2021.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack{
            Image(systemName: "camera.circle.fill")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .preferredColorScheme(.dark)
    }
}
