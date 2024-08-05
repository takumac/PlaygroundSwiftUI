//
//  BoundingBoxTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/08/05.
//

import SwiftUI

struct BoundingBoxTestView: View {
    
    @State private var isEditing = true
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 150
    @State private var location: CGPoint = CGPoint(x: 150, y: 100)
    @State private var formType: EditFormType = .freeForm
    
    var body: some View {
        VStack {
            
            Image(systemName: "nose")
                .resizable()
                .boundingBox(formType: formType,
                             isEditing: isEditing,
                             editingWidth: $width,
                             editingHeight: $height,
                             position: $location)
            
            HStack {
                Button {
                    formType = formType == .freeForm ? .uniform : .freeForm
                } label: {
                    Text(formType.rawValue)
                }
                
                Button {
                    isEditing.toggle()
                } label: {
                    Text("isEditing")
                }
            }
            
        }
    }
}

#Preview {
    BoundingBoxTestView()
}
