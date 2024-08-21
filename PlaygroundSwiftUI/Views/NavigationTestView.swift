//
//  NavigationTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/08/22.
//

import SwiftUI

struct NavigationTestView: View {
    @Environment(\.navigationRouter) var router
    
    @State var showModal1: Bool = false
    @State var showModal2: Bool = false
    
    var body: some View {
        ZStack {
            Color.red
                .opacity(0.8)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Navigation Test")
                    .font(.title)
                Button("Push SubView1") {
                    router.items.append(.pushSubView1)
                }
                Button("Push SubView2") {
                    router.items.append(.pushSubView2)
                }
                Button("Modal SubView1") {
                    showModal1 = true
                }
                Button("Modal SubView2") {
                    showModal2 = true
                }
                Button("戻る") {
                    router.items.removeLast()
                }
                Button("pop to root") {
                    if router.items.count > 1 {
                        router.items.removeSubrange(1..<router.items.count)
                    }
                }
            }
        }
        .sheet(isPresented: $showModal1) {
            ModalSubView1()
        }
        .sheet(isPresented: $showModal2) {
            ModalSubView2()
        }
    }
}

struct PushSubView1: View {
    @Environment(\.navigationRouter) var router
    
    @State var showModal1: Bool = false
    @State var showModal2: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .opacity(0.8)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("PushSubView1")
                    .font(.title)
                Button("Push NavigationTest") {
                    router.items.append(.navigationTest)
                }
                Button("Push SubView2") {
                    router.items.append(.pushSubView2)
                }
                Button("Modal SubView1") {
                    showModal1 = true
                }
                Button("Modal SubView2") {
                    showModal2 = true
                }
                Button("戻る") {
                    router.items.removeLast()
                }
                Button("pop to root") {
                    if router.items.count > 1 {
                        router.items.removeSubrange(1..<router.items.count)
                    }
                }
            }
        }
        .sheet(isPresented: $showModal1) {
            ModalSubView1()
        }
        .sheet(isPresented: $showModal2) {
            ModalSubView2()
        }
    }
}

struct PushSubView2: View {
    @Environment(\.navigationRouter) var router
    
    @State var showModal1: Bool = false
    @State var showModal2: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .opacity(0.8)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("PushSubView2")
                    .font(.title)
                Button("Push NavigationTest") {
                    router.items.append(.navigationTest)
                }
                Button("Push SubView1") {
                    router.items.append(.pushSubView1)
                }
                Button("Modal SubView1") {
                    showModal1 = true
                }
                Button("Modal SubView2") {
                    showModal2 = true
                }
                Button("戻る") {
                    router.items.removeLast()
                }
                Button("pop to root") {
                    if router.items.count > 1 {
                        router.items.removeSubrange(1..<router.items.count)
                    }
                }
            }
        }
        .sheet(isPresented: $showModal1) {
            ModalSubView1()
        }
        .sheet(isPresented: $showModal2) {
            ModalSubView2()
        }
    }
}

struct ModalSubView1: View {
    @State var router = NavigationRouter()
    
    @State var showModal1: Bool = false
    @State var showModal2: Bool = false
    
    var body: some View {
        NavigationStack(path: $router.items) {
            ZStack {
                Color.gray
                    .opacity(0.8)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    Text("ModalSubView1")
                        .font(.title)
                    Button("Push NavigationTest") {
                        router.items.append(.navigationTest)
                    }
                    Button("Push SubView1") {
                        router.items.append(.pushSubView1)
                    }
                    Button("Push SubView2") {
                        router.items.append(.pushSubView2)
                    }
                    Button("Modal SubView1") {
                        showModal1 = true
                    }
                    Button("Modal SubView2") {
                        showModal2 = true
                    }
                }
            }
            .setNavigationDestination()
            .sheet(isPresented: $showModal1) {
                ModalSubView1()
            }
            .sheet(isPresented: $showModal2) {
                ModalSubView2()
            }
        }
        .environment(\.navigationRouter, router)
    }
}

struct ModalSubView2: View {
    @State var router = NavigationRouter()
    
    @State var showModal1: Bool = false
    @State var showModal2: Bool = false
    
    var body: some View {
        NavigationStack(path: $router.items) {
            ZStack {
                Color.brown
                    .opacity(0.8)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    Text("ModalSubView2")
                        .font(.title)
                    Button("Push NavigationTest") {
                        router.items.append(.navigationTest)
                    }
                    Button("Push SubView1") {
                        router.items.append(.pushSubView1)
                    }
                    Button("Push SubView2") {
                        router.items.append(.pushSubView2)
                    }
                    Button("Modal SubView1") {
                        showModal1 = true
                    }
                    Button("Modal SubView2") {
                        showModal2 = true
                    }
                }
            }
            .setNavigationDestination()
            .sheet(isPresented: $showModal1) {
                ModalSubView1()
            }
            .sheet(isPresented: $showModal2) {
                ModalSubView2()
            }
        }
        .environment(\.navigationRouter, router)
    }
}

#Preview {
    NavigationTestView()
}
