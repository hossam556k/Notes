//
//  Note.swift
//  Notes Watch App
//
//  Created by MacBook Pro on 02/11/2026.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
