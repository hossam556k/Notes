//
//  Settings.swift
//  Notes Watch App
//
//  Created by MacBook Pro on 03/11/2026.
//

import SwiftUI

struct Settings: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    var body: some View {
        
        VStack (spacing: 3) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .foregroundColor(.accent)
        }
    }
}

#Preview {
    Settings()
}
