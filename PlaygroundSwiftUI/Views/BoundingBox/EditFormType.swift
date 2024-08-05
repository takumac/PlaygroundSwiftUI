//
//  EditFormType.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/08/05.
//

import Foundation

enum EditFormType: String, CaseIterable, Identifiable {
        
    case freeForm = "Free form"
    case uniform = "Uniform"
    
    var id: String { rawValue }
}
