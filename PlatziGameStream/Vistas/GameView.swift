//
//  GameView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 03/06/21.
//

import SwiftUI

struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion: String
    var anoPublicacion: String
    var descripcion:String
    var tags:[String]
    var imgsUrl: [String]
    
    var body: some View {
        
    
        ZStack {
            
            Color("Marine").ignoresSafeArea()
           
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
      
        }
   
    
    
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "Ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
