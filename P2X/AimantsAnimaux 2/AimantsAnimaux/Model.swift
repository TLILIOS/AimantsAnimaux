//
//  Model.swift
//  AimantsAnimaux
//
//  Created by Amandine Cousin on 24/10/2023.
//

import Foundation

// Enumere le type d'animal que l'on peut avoir
enum Breed : String, CaseIterable {
    case dog = "Chien"
    case cat = "Chat"
    case fish = "Poisson"
    case bird = "Oiseau"
    case rabbit = "Lapin"
}

// Represente un animal avec ses caracteristiques
struct Animal {
    let name: String
    let breed: Breed
    let age: Float
    let weight: Float
    let size: Float
}

/// Produce a string version of the given `breed`. This string correspond to an image name.
///
/// ```
/// getImageName(breed: Breed.cat) // "pawprint"
/// ```
///
/// - Parameters:
///     - breed: The breed to be convert.
///
/// - Returns: A string for the given `breed`.
func getImageName(breed: Breed) -> String {
    switch(breed) {
    case .bird:
        return "bird"
    case .fish:
        return "fish"
    case .rabbit:
        return "hare"
    default:
        return "pawprint"
    }
}

// Represente la liste des animaux de l'association
// C'est ce tableau que l'on affiche sur la premiere vue
var animalList: [Animal] = [Animal(name: "Max", breed: .dog, age: 5, weight: 8, size: 20), Animal(name: "Nuage", breed: .rabbit, age: 2, weight: 1.5, size: 10), Animal(name: "Blanche", breed: .bird, age: 1, weight: 0.2, size: 10), Animal(name: "Francis", breed: .fish, age: 0.3, weight: 0.2, size: 2.1)]

