//
//  View+Extension.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/08/05.
//

import SwiftUI

extension View {
    
    func boundingBox(
        formType: EditFormType,
        isEditing: Bool,
        editingWidth: Binding<CGFloat>,
        editingHeight: Binding<CGFloat>,
        position: Binding<CGPoint>
    ) -> some View {
        
        self.modifier(
            BondingBoxModifier(
                formType: formType,
                isEditing: isEditing,
                width: editingWidth,
                height: editingHeight,
                position: position
            )
        )
    }
}

struct BondingBoxModifier: ViewModifier {
    
    let formType: EditFormType
    let isEditing: Bool
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    @Binding var position: CGPoint
    
    func body(content: Content) -> some View {
        
        BoundingBox(
            formType: formType,
            isEditing: isEditing,
            editingWidth: $width,
            editingHeight: $height,
            position: $position
        ) {
            content
        }
    }
}
