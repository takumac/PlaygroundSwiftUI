//
//  MatchedGeometryEffectTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/06/23.
//

import SwiftUI

struct ColorStruct: Identifiable, Equatable {
    var id = UUID()
    var color: Color
    var name: String
}

struct MatchedGeometryEffectTestView: View {
    @Namespace private var namespace1
    @State private var selectedColorStruct: ColorStruct? = nil
    
    private var colorStructs = (1...16).map { index in
        switch index {
        case 1:
            ColorStruct(color: .red, name: "red")
        case 2:
            ColorStruct(color: .blue, name: "blue")
        case 3:
            ColorStruct(color: .green, name: "green")
        case 4:
            ColorStruct(color: .yellow, name: "yellow")
        case 5:
            ColorStruct(color: .orange, name: "orange")
        case 6:
            ColorStruct(color: .pink, name: "pink")
        case 7:
            ColorStruct(color: .purple, name: "purple")
        case 8:
            ColorStruct(color: .mint, name: "mint")
        case 9:
            ColorStruct(color: .indigo, name: "indigo")
        case 10:
            ColorStruct(color: .teal, name: "teal")
        case 11:
            ColorStruct(color: .brown, name: "brown")
        case 12:
            ColorStruct(color: .cyan, name: "cyan")
        case 13:
            ColorStruct(color: .accentColor, name: "accentColor")
        case 14:
            ColorStruct(color: .primary, name: "primary")
        case 15:
            ColorStruct(color: .secondary, name: "secondary")
        default:
            ColorStruct(color: .black, name: "black")
        }
    }
    
    private var columns = Array(repeating: GridItem(.fixed(50), spacing: 18), count: 4)
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: self.columns) {
                ForEach(self.colorStructs) { colorStruct in
                    VStack(spacing: 2) {
                        if selectedColorStruct != colorStruct {
                            Rectangle()
                                .cornerRadius(16)
                                .foregroundColor(colorStruct.color)
                                .matchedGeometryEffect(id: colorStruct.id, in: namespace1)
                                .frame(width: 50, height: 50)
                                .onTapGesture {
                                    withAnimation(.easeOutExpo) {
                                        selectedColorStruct = colorStruct
                                    }
                                }

                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 50, height: 50)
                        }
                        Text(colorStruct.name)
                            .font(.caption)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                }
            }
            .padding()
            
            // preview
            if let colorStruct = selectedColorStruct {
                Rectangle()
                    .cornerRadius(0)
                    .foregroundColor(colorStruct.color)
                    .matchedGeometryEffect(id: colorStruct.id, in: namespace1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation(.easeOutExpo) {
                            selectedColorStruct = nil
                        }
                    }
            }
        }
    }
}

extension Animation {
  static let easeOutExpo: Animation = .timingCurve(0.25, 0.8, 0.1, 1, duration: 0.5)
}

#Preview {
    MatchedGeometryEffectTestView()
}
