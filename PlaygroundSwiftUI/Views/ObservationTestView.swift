//
//  ObservationTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/08/22.
//

import SwiftUI
import Observation

struct ObservationTestView: View {
    var body: some View {
        
        // MARK: - WWDC2023の動画検証用
//        ObservationTest1View()
        
        // MARK: - テスト2用
//        ObservationTest2View()
        
        // MARK: - テスト2用
        ObservationTest3View()
        
    }
}


// MARK: - WWDC2023の動画検証用
struct ObservationTest1View: View {
    
    var donutList: DonutList = DonutList(donuts: [])
    @State var donutToAdd: Donut?
    @State var name: String = ""
    
    var body: some View {
        List {
            Section {
                ForEach(donutList.donuts) { donut in
                    DonutView(donut: donut)
                }
                Button("Add Donut") {
                    donutToAdd = Donut()
                }
            } header: {
                Text("Donut")
            }
        }
        .sheet(item: $donutToAdd) { _ in
            TextField("Name", text: $name)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .border(.gray)
                .frame(width: 300)
            Button("Save") {
                donutToAdd?.name = name
                donutList.donuts.append(donutToAdd!)
                self.donutToAdd = nil
                self.name = ""
            }
            Button("Cancel") { donutToAdd = nil }
        }
    }
}

struct DonutView: View {
    @State var donut: Donut

    var body: some View {
        TextField("Name", text: $donut.name)
    }
}

@Observable class Donut: Identifiable {
    var name: String = ""
}

@Observable class DonutList {
    var donuts: [Donut]
    
    init(donuts: [Donut]) {
        self.donuts = donuts
    }
}


// MARK: - テスト2用
struct ObservationTest2View: View {
    
    @State var test2ViewModel = ObservationTest2ViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 10) {
                Text("MainView")
                    .font(.title)
                Text(test2ViewModel.text)
                    .font(.title2)
                Button("Change Hoge") {
                    test2ViewModel.textChangeHoge()
                }
                Button("Change Fuga") {
                    test2ViewModel.textChangeFuga()
                }
                TextField(test2ViewModel.text, text: $test2ViewModel.text)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .border(.gray)
                    .frame(width: 200)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .border(.red)
            
            ObservationTest2SubView1(test2ViewModel: test2ViewModel)
                .border(.blue)
            
            ObservationTest2SubView2(test2ViewModel: test2ViewModel)
                .border(.green)
        }
    }
}

struct ObservationTest2SubView1: View {
    @State var test2ViewModel: ObservationTest2ViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("SubView1")
                .font(.title)
            Text(test2ViewModel.text)
                .font(.title2)
            Button("Change Hoge") {
                test2ViewModel.textChangeHoge()
            }
            Button("Change Fuga") {
                test2ViewModel.textChangeFuga()
            }
            TextField(test2ViewModel.text, text: $test2ViewModel.text)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .border(.gray)
                .frame(width: 200)
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

struct ObservationTest2SubView2: View {
    @Bindable var test2ViewModel: ObservationTest2ViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("SubView2")
                .font(.title)
            Text(test2ViewModel.text)
                .font(.title2)
            Button("Change Hoge") {
                test2ViewModel.textChangeHoge()
            }
            Button("Change Fuga") {
                test2ViewModel.textChangeFuga()
            }
            TextField(test2ViewModel.text, text: $test2ViewModel.text)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .border(.gray)
                .frame(width: 200)
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

@Observable final class ObservationTest2ViewModel {
    var text: String = "Init"
    
    func textChangeHoge() {
        text = "Hoge"
    }
    
    func textChangeFuga() {
        text = "Fuga"
    }
}


// MARK: - テスト2用
struct ObservationTest3View: View {
    @State var id = "100"
    @State var idViewModel = ViewModel(id: "100")
    
    var body: some View {
        VStack {
            StateView(viewModel: idViewModel)
            BindableView(viewModel: idViewModel)
            BindingView(id: $idViewModel.id)
            Button("Parent Change") {
                id += "0"
                idViewModel.id += "0"
            }
        }
    }
}

@Observable final class ViewModel {
    var id: String
    var isPresented = false
    
    init(id: String) {
        self.id = id
    }
}

struct StateView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("StateView")
            Text(viewModel.id)
            Button("reset") {
                viewModel.id = "100"
            }
        }
    }
}

struct BindableView: View {
    @Bindable var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("BindableView")
            Text(viewModel.id)
            Button("reset") {
                viewModel.id = "110"
            }
        }
    }
}

struct BindingView: View {
    @Binding var id: String
    
    var body: some View {
        VStack {
            Text("BindingView")
            Text(id)
            Button("reset") {
                id = "120"
            }
        }
    }
}


#Preview {
    ObservationTestView()
}
