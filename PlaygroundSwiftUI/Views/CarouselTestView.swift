//
//  CarouselTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/09/28.
//

import SwiftUI

struct CarouselTestView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(0..<10) { index in
                    Text(index.description)
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(
                            Color(hue: Double(index) / 10, saturation: 1, brightness: 1),
                            in: .rect(cornerRadius: 10)
                        )
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 30)
    }
}

#Preview {
    CarouselTestView()
}
