//
//  MealListModel.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import Foundation

struct MealList: Codable {
	var meals: [Meal]
}

struct Meal: Codable, Identifiable, Comparable {
	var idMeal: String
	var strMeal: String
	var strMealThumb: String
	
	var id: String { idMeal }
	
	static func < (lhs: Meal, rhs: Meal) -> Bool {
		lhs.strMeal < rhs.strMeal
	}
}
