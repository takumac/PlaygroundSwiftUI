//
//  ScrollTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/09/28.
//

import SwiftUI

struct ScrollTestView: View {
    var body: some View {
        ScrollViewTest()
//        ListTest()
    }
}

struct ScrollViewTest: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ForEach(0..<20) { index in
                    Text(index.description)
                        .frame(width: 300, height: 300)
                        .background(
                            Color(hue: Double(index) / 20, saturation: 1, brightness: 1),
                            in: .rect(cornerRadius: 10)
                        )
                        .scrollTransition(.interactive, axis: .vertical) { visualEffect, transitionPhase in
                            visualEffect
                                .scaleEffect(transitionPhase.isIdentity ? 1 : 0.5)
                        }
                }
            }
        }
        .refreshable {
            try? await Task.sleep(seconds: 3)
        }
    }
}

struct ListTest: View {
    var body: some View {
        List {
            ForEach(0..<20) { index in
                Text(index.description)
                    .frame(width: 300, height: 300)
                    .background(
                        Color(hue: Double(index) / 20, saturation: 1, brightness: 1),
                        in: .rect(cornerRadius: 10)
                    )
                    .listRowBackground(Color.clear)
            }
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ScrollTestView()
}
