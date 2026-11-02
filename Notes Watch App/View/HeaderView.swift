//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by MacBook Pro on 02/11/2026.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTY
    var title: String = ""
    var body: some View {
        
        VStack {
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accent)
            }
        }
        HStack {
            Capsule()
                .frame(height: 1)

            Image(systemName: "note.text")

            Capsule()
                .frame(height: 1)
        }
        .foregroundColor(.accentColor)
    }
}

#Preview {
    HeaderView()
}


#Preview {
    HeaderView(title: "Creaits")
}
