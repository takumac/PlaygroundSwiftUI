//
//  ContentView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/06/23.
//

import SwiftUI

struct ContentView: View {
    // NavigationRouter
    @State var router = NavigationRouter()
    
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
                    Button("BoundingBoxTest") {
                        router.items.append(.boundingBoxTest)
                    }
                    Spacer().frame(height: 20)
                    Button("NavigationTest") {
                        router.items.append(.navigationTest)
                    }
                    Spacer().frame(height: 20)
                    Button("ObservationTest") {
                        router.items.append(.observationTest)
                    }
                    Spacer().frame(height: 20)
                    Button("LoadingDialogTest") {
                        router.items.append(.loadingDialogTest)
                    }
                    Spacer().frame(height: 20)
                }
            }
            .setNavigationDestination()
            .navigationTitle("HOME")
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.navigationRouter, router)
    }
}

#Preview {
    ContentView()
}
