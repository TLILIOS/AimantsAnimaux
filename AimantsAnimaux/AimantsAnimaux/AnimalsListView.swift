//
//  AnimalsListView.swift
//  AimantsAnimaux
//
//  Created by HTLILI on 17/07/2024.
//

import SwiftUI

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
