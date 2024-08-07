//
//  EditPointMark.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/08/05.
//

import SwiftUI

struct EditPointMark: View {
    
    private let editPointFrame = EditPointFrame()
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .shadow(radius: 1)
                .frame(width: editPointFrame.outerCircleDiameter,
                       height: editPointFrame.outerCircleDiameter)
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: editPointFrame.innerCircleDiameter,
                       height: editPointFrame.innerCircleDiameter)
        }
    }
}

struct EditPointMark_Previews: PreviewProvider {
    static var previews: some View {
        EditPointMark()
    }
}
