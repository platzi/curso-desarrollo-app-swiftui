//
//  GamesView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 13/05/21.
//

import SwiftUI

struct GamesView:View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    var body: some View{
        
        
        Text("Hola desde GamesView").navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(perform: {
            
            //Muestra la información del primer elemento del json
            print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
            print("Titulo del primer elemento del json: \(todosLosVideojuegos.gamesInfo[0].title)")
        })
        
    }
}

