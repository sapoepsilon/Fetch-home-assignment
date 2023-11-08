//
//  MealDetailViewModel.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
	@Published var mealDetail: MealInfo?
	@Published var showInstructions = false
	@Published var showIngredients = false
	
	private var cancellables = Set<AnyCancellable>()
	private let mealId: String
	
	init(mealId: String) {
		self.mealId = mealId
		fetchMealDetail()
	}
	
	private func fetchMealDetail() {
		MealFetchRepository().getMealDetail(id: mealId) { [weak self] detail in
			DispatchQueue.main.async {
				self?.mealDetail = detail
			}
		}
	}
}
