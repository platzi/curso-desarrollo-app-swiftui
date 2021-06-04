//
//  GameView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 03/06/21.
//

import SwiftUI
import AVKit

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
                video(url: url).frame(height:300)
                
                
                ScrollView {
                
                   //Informacion Video
                   
                    videoInfo(titulo:titulo,studio:studio,calificacion:calificacion,anoPublicacion:anoPublicacion,descripcion:descripcion,tags:tags)
                        .padding(.bottom)
               
                    
                
                
                }.frame( maxWidth: .infinity)
            }
      
        }
   
    
    
    }
}

struct video:View {
    
    var url:String
    
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
        
        
        
    }
    
    
    
}


struct videoInfo:View {
    
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    
    
    
    var body: some View{
        
        
        
        VStack(alignment:.leading ){
            
          Text("\(titulo)")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(.leading)
            
            HStack{
                
                
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                
                
            }
            
           Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
            
            
            HStack{
                
                
                ForEach(tags, id:\.self){
                    
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top,4)
                        .padding(.leading)
                    
                    
                    
                }
                
                
                
            }
            
            
            
            
        }.frame( maxWidth: .infinity,  alignment: .leading)
        
        
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "Ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
