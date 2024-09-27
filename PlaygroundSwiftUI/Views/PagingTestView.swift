//
//  PagingTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/09/27.
//

import SwiftUI

struct PagingTestView: View {
    @State private var selection = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Image(systemName: "books.vertical").tag(0)
                Image(systemName: "square.and.arrow.up").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            
            TabView(selection: $selection) {
                Page1().tag(0)
                Page2().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: selection)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Page1: View {
    let elements = ["elements1","elements2","elements3","elements4","elements5","elements6","elements7","elements8","elements9","elements10"]
    var body: some View {
        List {
            ForEach(elements, id: \.self) { element in
                Text(element)
                    .frame(width: 300, height: 200)
                    .background(.orange)
                    .padding([.top, .bottom])
                    .listRowBackground(Color.clear)
            }
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
        .background(.red)
        .refreshable {
            try? await Task.sleep(seconds: 3)
        }
        .onAppear {
            print("Page1: onAppear()")
        }
        .task {
            print("Page1: task()")
        }
        .onDisappear {
            print("Page1: onDisappear()")
        }
    }
}

struct Page2: View {
    let elements = ["elements1","elements2","elements3","elements4","elements5","elements6","elements7","elements8","elements9","elements10"]
    var body: some View {
        List {
            ForEach(elements, id: \.self) { element in
                Text(element)
                    .frame(width: 300, height: 200)
                    .background(.green)
                    .padding([.top, .bottom])
                    .listRowBackground(Color.clear)
            }
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
        .background(.blue)
        .refreshable {
            try? await Task.sleep(seconds: 3)
        }
        .onAppear {
            print("Page2: onAppear()")
        }
        .task {
            print("Page2: task()")
        }
        .onDisappear {
            print("Page2: onDisappear()")
        }
    }
}

#Preview {
    PagingTestView()
}
