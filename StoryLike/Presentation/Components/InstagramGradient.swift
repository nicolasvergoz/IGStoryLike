import SwiftUI

extension ShapeStyle where Self == RadialGradient {
    static func instagramGradient(size: CGFloat) -> RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [
                Color(hex: "#f9ce34"),
                Color(hex: "#ee2a7b"),
                Color(hex: "#6228d7"),
            ]),
            center: .init(x: 0, y: 1),
            startRadius: 0,
            endRadius: size * 1.2
        )
    }
}

extension View {
    
}

#Preview {
    let size: CGFloat = 200
    RoundedRectangle(cornerRadius: 16)
        .stroke(
            .instagramGradient(size: size),
            lineWidth: 4
        )
        .frame(width: size, height: size)
}
