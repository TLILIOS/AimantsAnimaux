//
//  AnimalDetailView.swift
//  AimantsAnimaux
//
//  Created by HTLILI on 17/07/2024.
//

import SwiftUI

struct AnimalDetailView: View {
   var animal: Animal
    
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
                    LineView(title: "Taille", value: "\(animal.size) cm")
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

// -To Be Fexed: -
#Preview {    
    AnimalDetailView(animal: animalList[0])
}
