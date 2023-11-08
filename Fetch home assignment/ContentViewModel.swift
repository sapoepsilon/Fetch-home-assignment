//
//  ContentViewModel.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import Foundation
class ContentViewViewModel: ObservableObject {
	@Published var meals: [Meal] = []
	
	func fetchMeals() {
		MealFetchRepository().getMealList { [weak self] newMeals in
			DispatchQueue.main.async {
				self?.meals = newMeals
			}
		}
	}
}
