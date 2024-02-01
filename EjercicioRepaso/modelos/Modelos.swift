//
//  Modelos.swift
//  EjercicioRepaso
//
//  Created by Sergio Morón on 25/01/2024.
//

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

// MARK: - Meals
struct Meals: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    let strCategory: String!
    let strArea: String!
    let strInstructions: String!
}
