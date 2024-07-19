//
//  AddNewAnimalView.swift
//  Exercice-P2
//
//  Created by Amandine Cousin on 26/09/2023.
//

import SwiftUI

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
                TextField("Taille (en cm)", value: $size, format: .number)
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
