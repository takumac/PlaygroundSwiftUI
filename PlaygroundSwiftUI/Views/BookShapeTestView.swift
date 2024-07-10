//
//  BookShapeTestView.swift
//  PlaygroundSwiftUI
//
//  Created by Takumi Sakai on 2024/07/10.
//

import SwiftUI

struct BookShapeTestView: View {
    var body: some View {
        ZStack {
            // Book shape with border
            BookShape()
                .stroke(Color.red, lineWidth: 2)
                .frame(width: 300, height: 250)
            
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

// Custom Book Shape resembling Apple systemImage "book"
struct BookShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Calculate control point offset as a fraction of height
        let controlPointOffset = rect.height * 0.1
        
        // Left side
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.midX * 0.6, y: rect.minY - controlPointOffset))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX * 0.6, y: rect.maxY - controlPointOffset))
        path.closeSubpath()
        
        // Right side
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY),
                          control: CGPoint(x: rect.midX * 1.4, y: rect.minY - controlPointOffset))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                          control: CGPoint(x: rect.midX * 1.4, y: rect.maxY - controlPointOffset))
        path.closeSubpath()

        return path
    }
}

#Preview {
    BookShapeTestView()
}
