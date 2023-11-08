//
//  ContentView.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel = ContentViewViewModel()
	
	var body: some View {
		NavigationView {
			List(viewModel.meals) { meal in
				NavigationLink(destination: MealDetailView(mealId: meal.idMeal, mealName: meal.strMeal)) {
					HStack {
						AsyncImage(url: URL(string: meal.strMealThumb)) { image in
							image.resizable()
						} placeholder: {
							Color.gray.shimmering()
						}
						.frame(width: 50, height: 50)
						.cornerRadius(5)
						
						Text(meal.strMeal)  .accessibility(identifier: "mealNavigationDetailTitle")
					}
				}
			}
			.navigationBarTitle("Desserts")
			.onAppear {
				viewModel.fetchMeals()
			}
		}
	}
}

	
#Preview {
    ContentView()
}
