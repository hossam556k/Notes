//
//  CreaditsView.swift
//  Notes Watch App
//
//  Created by MacBook Pro on 03/11/2026.
//

import SwiftUI

struct CreaditsView: View {
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    var body: some View {
        VStack(spacing: 3) {
            
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            // Conteny
            Text("Robert Petres")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

#Preview {
    CreaditsView()
}
