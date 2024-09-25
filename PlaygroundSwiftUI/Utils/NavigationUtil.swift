//
//  NavigationUtil.swift
//  PlaygroundSwiftUI
//
//  ナビゲーションに関する処理のUtilクラス
//
//  Created by Takumi Sakai on 2024/06/23.
//

import SwiftUI
import Observation


// MARK: - NavigationRouter
@Observable final class NavigationRouter {
    @MainActor var items: [NavigationItem] = []
    
    enum NavigationItem: Hashable {
        case matchedGeometryEffectTest
        case bookShapeTest
        case customTextTest
        case boundingBoxTest
        case navigationTest
        case pushSubView1
        case pushSubView2
        case observationTest
        case loadingDialogTest
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
                case .navigationTest:
                    NavigationTestView()
                case .pushSubView1:
                    PushSubView1()
                case .pushSubView2:
                    PushSubView2()
                case .observationTest:
                    ObservationTestView()
                case .loadingDialogTest:
                    LoadingDialogTextView()
                }
            }
    }
}


// MARK: - Environment Setting
/// EnvironmentKey
fileprivate struct NavigationRouterKey: EnvironmentKey {
    static let defaultValue = NavigationRouter()
}

/// EnvironmentValue
extension EnvironmentValues {
    var navigationRouter: NavigationRouter {
        get { self[NavigationRouterKey.self] }
        set { self[NavigationRouterKey.self] = newValue }
    }
}


// MARK: - View Extension for Navigation
extension View {
    /// Viewに対してNavigationDestinationのModifierを付与する
    func setNavigationDestination() -> some View {
        modifier(NavigationDestination())
    }
}
