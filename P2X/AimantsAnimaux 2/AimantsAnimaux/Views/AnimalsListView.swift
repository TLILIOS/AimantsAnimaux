//
//  AnimalsListView.swift
//  AimantsAnimaux
//
//  Created by Amandine Cousin on 04/10/2023.
//

import SwiftUI

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


#Preview {
    AnimalsListView()
}
