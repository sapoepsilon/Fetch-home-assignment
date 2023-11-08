//
//  MealDetailView.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import Foundation
import SwiftUI

struct MealDetailView: View {
	let mealId: String
	let mealName: String
	@StateObject private var viewModel: MealDetailViewModel
	
	init(mealId: String, mealName: String) {
		self.mealId = mealId
		self.mealName = mealName
		_viewModel = StateObject(wrappedValue: MealDetailViewModel(mealId: mealId))
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 20) {
				if let mealDetail = viewModel.mealDetail {
					MealDetailContent(mealDetail: mealDetail, viewModel: viewModel)
				} else {
					MealDetailLoadingView()
				}
			}
			.navigationBarTitle(mealName, displayMode: .automatic)
			.padding()
		}
	}
}

private struct MealDetailContent: View {
	
	let mealDetail: MealInfo
	@ObservedObject var viewModel: MealDetailViewModel
	
	var body: some View {
		AsyncImage(url: URL(string: mealDetail.strMealThumb)) { image in
			image.resizable()
				.aspectRatio(contentMode: .fit)
				.cornerRadius(10)
		} placeholder: {
			ZStack {
				Rectangle()
					.foregroundColor(.gray)
					.aspectRatio(contentMode: .fit)
					.cornerRadius(10)
					.shimmering()
			}
		}
		
		Toggle(isOn: $viewModel.showInstructions.animation()) {
			Text("Instructions")
				.font(.headline)
		}.toggleStyle(.button)
			.accessibility(identifier: "InstructionToggle")
		
		if viewModel.showInstructions {
			Text(mealDetail.strInstructions)
				.transition(.slide)
				.accessibility(identifier: "InstructionsText")
		}
		
		Toggle(isOn: $viewModel.showIngredients.animation()) {
			Text("Ingredients")
				.font(.headline)
		}.toggleStyle(.button)
			.accessibility(identifier: "IngredientsToggle")
		
		
		if viewModel.showIngredients {
			ForEach(mealDetail.ingredients.sorted(by: <), id: \.key) { key, value in
				Text("\(key): \(value)")
					.padding(.leading)
					.transition(.opacity)
					.accessibility(identifier: "IngredientsText")
			}
		}
		
	}
}

private struct MealDetailLoadingView: View {
	@State var falseToggle: Bool = false
	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			VStack {
				Rectangle()
					.foregroundColor(.gray)
					.cornerRadius(10)
					.shimmering()
			}
			.frame(height: 310)
			.padding()
			Toggle(isOn: $falseToggle) {
				Text("Instructions")
					.font(.headline)
			}.toggleStyle(.button)
			
			Toggle(isOn: $falseToggle) {
				Text("Ingredients")
					.font(.headline)
			}.toggleStyle(.button)
		}
	}
}
