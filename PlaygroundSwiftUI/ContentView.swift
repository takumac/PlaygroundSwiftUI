//
//  ContentView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/06/23.
//

import SwiftUI

struct ContentView: View {
    // NavigationRouter
    @StateObject var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.items) {
            ScrollView([.vertical]) {
                VStack(spacing: 20) {
                    Spacer().frame(height: 20)
                    Button("MatchedGeometryEffectTest") {
                        router.items.append(.matchedGeometryEffectTest)
                    }
                    Spacer().frame(height: 20)
                    Button("BookShapeTest") {
                        router.items.append(.bookShapeTest)
                    }
                    Spacer().frame(height: 20)
                    Button("CustomTextTest") {
                        router.items.append(.customTextTest)
                    }
                    Spacer().frame(height: 20)
                }
            }
            .setNavigationDestination()
            .navigationTitle("HOME")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
