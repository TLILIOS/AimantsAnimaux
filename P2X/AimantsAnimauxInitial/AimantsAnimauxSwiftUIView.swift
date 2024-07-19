//
//  AimantsAnimauxSwiftUIView.swift
//  AimantsAnimaux
//
//  Created by Amandine Cousin on 24/10/2023.
//

import SwiftUI

/// ------- Model ---------

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


///  ------- Vues ---------

// Affiche la liste des animaux
struct AnimalsListView: View {
    @State private var showingAdd = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("aimantsDanimauxBan")
                    .resizable()
                    .background(.clear)
                    .frame(height: 130)
                    .aspectRatio(contentMode: .fit)
                
                List(animalList, id: \.name) { animal in
                    NavigationLink {
                        AnimalDetailView(animal: animal)
                    } label: {
                        AnimalRow(animal: animal)
                    }
                }
                .navigationTitle("Liste des animaux")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink {
                            AddNewAnimalView()
                        } label : {
                            Text("Ajouter")
                        }
                    }
                }
            }
        }
        
    }
    
    // Represente la vue d'une ligne de la liste
    struct AnimalRow: View {
        let animal: Animal
        
        var body: some View {
            HStack {
                Image(systemName: getImageName(breed: animal.breed))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color.green)
                    .frame(width: 40, height: 40)
                    .padding(8)
                Text(animal.name)
                    .bold()
                Spacer()
            }
        }
    }
}


// Affiche le detail des informations pour un animal donné
struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        VStack {
            Image(systemName: getImageName(breed: animal.breed))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.green)
                .padding()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.green, lineWidth: 5)
                }
                .frame(width: 100, height: 100)
            GroupBox(label: Label("Description", systemImage: "list.clipboard")) {
                VStack(alignment: .leading) {
                    LineView(title: "Nom", value: animal.name)
                    LineView(title: "Race", value: animal.breed.rawValue)
                    LineView(title: "Age", value: "\(animal.age) an(s)")
                    LineView(title: "Poids", value: "\(animal.weight) kg")
                }
                .padding()
            }
            .padding()
        }
        Spacer()
    }
    
    // Represente la vue d'une ligne qui permet de visualiser le champs et sa valeur
    struct LineView : View {
        let title: String
        let value: String
        
        var body: some View {
            HStack {
                Text("\(title) : ")
                Spacer()
                Text(value)
            }
        }
    }
}


// La vue qui permet d'ajouter un nouvel animal a la liste existante
struct AddNewAnimalView: View {
    @State var name: String = ""
    @State var breed: Breed = .dog
    @State var age: Float?
    @State var weight: Float?
    @State var size: Float?
    
    var body: some View {
        VStack {
            Text("Ajouter un nouvel animal")
                .font(.largeTitle)
            Form {
                TextField("Nom", text: $name)
                Picker("Espèce", selection: $breed) {
                    ForEach(Breed.allCases, id:\.self) { b in
                        Text(b.rawValue)
                    }
                }
                TextField("Age (en années)", value: $age, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Poids (en kg)", value: $weight, format: .number)
                    .keyboardType(.decimalPad)
            }
            Button(action:  {
                if (formIsValid) {
                    // Ici on ajoutera notre animal dans le tableau déjà utilisée pour afficher la liste des animaux
                    let _ = print("Ajout de \(name) à la liste")
                }
            }) {
                Spacer()
                Text("Ajouter")
                    .font(.title)
                Spacer()
            }
            .disabled(!formIsValid)
            .padding(.top, 22)
            .background(buttonColor)
            .foregroundColor(.white)
        }
    }
    
    // formIsValid sera egal a true si on a au moins le champs name du formulaire qui est rempli
    var formIsValid: Bool {
        return !name.isEmpty
    }
    
    // la couleur du bouton de validation sera verte si le formulaire est valide et gris sinon
    var buttonColor: Color {
        return formIsValid ? .green : .gray
    }
}
