//
//  NavigationUtil.swift
//  PlaygroundSwiftUI
//
//  ナビゲーションに関する処理のUtilクラス
//
//  Created by Takumi Sakai on 2024/06/23.
//

import SwiftUI


// MARK: - NavigationRouter
final class NavigationRouter: ObservableObject {
    @MainActor @Published var items: [NavigationItem] = []
    
    enum NavigationItem: Hashable {
        case matchedGeometryEffectTest
        case bookShapeTest
        case customTextTest
        case boundingBoxTest
    }
}


// MARK: - NavigationDestination
struct NavigationDestination: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: NavigationRouter.NavigationItem.self) { item in
                switch item {
                case .matchedGeometryEffectTest:
                    MatchedGeometryEffectTestView()
                case .bookShapeTest:
                    BookShapeTestView()
                case .customTextTest:
                    CustomTextTestView()
                case .boundingBoxTest:
                    BoundingBoxTestView()
                }
            }
    }
}


// MARK: - View Extension for Navigation
extension View {
    /// Viewに対してNavigationDestinationのModifierを付与する
    func setNavigationDestination() -> some View {
        modifier(NavigationDestination())
    }
}
