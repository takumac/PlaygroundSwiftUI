//
//  CustomTextTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/07/11.
//

import SwiftUI

struct CustomTextTestView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("This is a SwiftUI Text")
                        .font(.title)
                        .padding()
                    
                    VStack {
                        UILabelWrapper(text: "この物語は犬やライオン等、普通は会話をしない動物との会話を楽しめる物語です。")
                            .frame(width: geometry.size.width * 0.65, height: geometry.size.height * 0.2) // 高さのフレームを指定
                            .background(.red)
                        UILabelWrapper(text: "この物語は犬やライオン等、普通は会話をしない動物との会話を楽しめる物語です。")
                            .frame(width: geometry.size.width * 0.65, height: geometry.size.height * 0.2) // 高さのフレームを指定
                            .background(.red)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        }
}

struct UILabelWrapper: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        
        // 幅の制約を設定
        if uiView.constraints.isEmpty {
            let widthConstraint = uiView.widthAnchor.constraint(equalToConstant: 200)
            widthConstraint.isActive = true
        }
    }
}

#Preview {
    CustomTextTestView()
}
