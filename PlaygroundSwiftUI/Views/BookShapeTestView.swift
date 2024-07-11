//
//  BookShapeTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/07/10.
//

import SwiftUI

struct BookShapeTestView: View {
    let width: CGFloat = 300.0
    let height: CGFloat = 250.0
    let borderWidth = 1.0
    let borderColor = Color.black
    let fillColor = Color.red
    
    var body: some View {
        ZStack {
            // Book shape with border
            ZStack {
                BookShape()
                    .fill(.white)
                    .frame(width: width, height: height)
                    .overlay(
                        BookShape()
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
                    .offset(y: borderWidth * 5)
                    .shadow(color: .black, radius: borderWidth * 5, y: borderWidth * 5)
                
                BookShape()
                    .fill(.white)
                    .frame(width: width, height: height)
                    .overlay(
                        BookShape()
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
                    .offset(y: borderWidth * 2.5)
                
                BookShape()
                    .fill(fillColor)
                    .frame(width: width, height: height)
                    .overlay(
                        BookShape()
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
            }
            
            // Text inside the book
            VStack {
                Text("This is a book view.")
                    .font(.title)
                    .padding()
                Spacer()
                Text("You can put any content here.")
                    .font(.body)
                    .padding()
            }
            .frame(width: 250, height: 200)
        }
        .padding()
    }
}

struct BookShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let controlPointOffset = rect.height * 0.1
        
        // Left side
        path.move(
            to: CGPoint(
                x: rect.minX,
                y: rect.minY
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x: rect.midX,
                y: rect.minY
            ),
            control: CGPoint(
                x: rect.midX * 0.6,
                y: rect.minY - controlPointOffset
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.maxY
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX,
                y: rect.maxY
            ),
            control: CGPoint(
                x: rect.midX * 0.6,
                y: rect.maxY - controlPointOffset
            )
        )
        path.closeSubpath()
        
        // Right side
        path.move(
            to: CGPoint(
                x: rect.midX,
                y: rect.minY
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x: rect.maxX,
                y: rect.minY
            ),
            control: CGPoint(
                x: rect.midX * 1.4,
                y: rect.minY - controlPointOffset
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.maxX,
                y: rect.maxY
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x: rect.midX,
                y: rect.maxY
            ),
            control: CGPoint(
                x: rect.midX * 1.4,
                y: rect.maxY - controlPointOffset
            )
        )
        path.closeSubpath()

        return path
    }
}

#Preview {
    BookShapeTestView()
}
