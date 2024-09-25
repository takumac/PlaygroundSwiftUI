//
//  LoadingDialogTextView.swift
//  PlaygroundSwiftUI
//
//  Created by sakai on 2024/09/25.
//

import SwiftUI

struct LoadingDialogTextView: View {
    @State var isLoading: Bool?
    
    var body: some View {
        ZStack {
            Button("Loading Start") {
                isLoading = true
            }
            .disabled(isLoading ?? false)
            .task(id: isLoading) {
                guard let _isLoading = isLoading, _isLoading else { return }
                
                do {
                    try await Task.sleep(seconds: 10)
                } catch {
                    print("error")
                }
                
                isLoading = false
            }
            
            if isLoading ?? false {
                ProgressView2()
            }
        }
    }
}

struct ProgressView1: View {
    @State var start: Bool = false
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.largeTitle.bold())
                .foregroundStyle(.black)
            Text("Loading...")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                .frame(width: 200, height: 50)
                .background(.black)
                .mask {
                    Circle()
                        .frame(width: 40, height: 40)
                        .offset(x: start ? -60 : 60)
                }
            Circle()
                .stroke(.black, lineWidth: 5)
                .frame(width: 40, height: 40)
                .offset(x: start ? -60 : 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.7))
        .onAppear {
            withAnimation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: true)
            ) {
                start = true
            }
        }
    }
}

struct ProgressView2: View {
    @State var rotationAmount: Double = 0.0
    @State var offsetYForBounce = 0.0
    let text = "Now Loading..."
    
    var body: some View {
        VStack(alignment: .center) {
            BookShapeTestView()
                .scaleEffect(CGSize(width: 0.7, height: 0.7), anchor: .center)
                .padding()
                .rotationEffect(.degrees(rotationAmount), anchor: .center)
            HStack(spacing: 0) {
                ForEach(Array(text.enumerated()), id: \.offset) { index, char in
                    Text(String(char)).font(.title).bold()
                        .offset(x: 0, y: offsetYForBounce)
                        .animation(
                            .spring(response: 0.6, dampingFraction: 0.3)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.05),
                            value: offsetYForBounce
                        )
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.7))
        .task {
            offsetYForBounce = -20.0
            await startShaking()
        }
    }
    
    func startShaking() async {
        let animation1 = Animation.easeOut(duration: 0.2)
        withAnimation(animation1) { rotationAmount = -5.0 }
        let animation2 = Animation.easeOut(duration: 0.2).repeatForever(autoreverses: true)
        withAnimation(animation2) { rotationAmount = 5.0 }
        
        try? await Task.sleep(seconds: 1.0)
        await stopShaking()
        try? await Task.sleep(seconds: 1.0)
        if !Task.isCancelled {
            await startShaking()
        }
    }
    
    func stopShaking() async {
        withAnimation(Animation.easeOut(duration: 0.5)) { rotationAmount = 0 }
    }
}


#Preview {
    LoadingDialogTextView()
}
