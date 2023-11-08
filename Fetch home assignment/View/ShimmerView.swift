//
//  ShimmerView.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import SwiftUI

struct ShimmerEffect: ViewModifier {
	@State private var isAnimating = false
	
	func body(content: Content) -> some View {
		content
			.overlay(
				LinearGradient(
					gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.3), Color.clear]),
					startPoint: .leading,
					endPoint: .trailing
				)
				.offset(x: isAnimating ? 300 : -300)
				.animation(
					Animation.linear(duration: 1)
						.repeatForever(autoreverses: false),
					value: isAnimating
				)
			)
			.onAppear {
				isAnimating = true
			}
	}
}

extension View {
	func shimmering() -> some View {
		self.modifier(ShimmerEffect())
	}
}
