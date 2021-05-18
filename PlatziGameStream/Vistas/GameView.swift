//
//  GameView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 15/05/21.
//

import SwiftUI
import AVKit
import Kingfisher


struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    var imgsUrl:[String]
    
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack {
                
                
                
                video(url: url).frame( height: 300)
                
                
                ScrollView {
                    videoInfo(titulo:titulo, studio: studio,calificacion:calificacion,anoPublicacion:anoPublicacion,descripcion:descripcion,tags:tags, imgsUrl: imgsUrl).padding(.bottom)
                    
                    Galery(imgsUrl:imgsUrl)
                    
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
    
    
    @State var isGameSaved = false
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    var imgsUrl:[String]
    
    var body: some View{
        
        
        VStack(alignment: .leading){
            
            HStack {
                Text("\(titulo)").foregroundColor(.white).font(.largeTitle).padding(.leading)
                
                Spacer()
                
                Button(action: {
                        isGameSaved = true}, label: {
                            Image(systemName: "heart.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 18, height: 18).foregroundColor(.white).padding()
                        }).alert(isPresented: $isGameSaved) {
                            Alert(title: Text("Guardado"), message: Text("El juego \(titulo) se guardo exitosamente"), dismissButton: .default(Text("Entendido")))
                        }
                
                
            }
            
            HStack{
                
                Text("\(studio)").foregroundColor(.white).font(.subheadline).padding(.top,5).padding(.leading)
                
                Text("\(calificacion)").foregroundColor(.white).font(.subheadline).padding(.top,5)
                
                Text("\(anoPublicacion)").foregroundColor(.white).font(.subheadline).padding(.top,5)
                
            }
            
            Text("\(descripcion)").foregroundColor(.white).font(.subheadline).padding(.top,5).padding(.leading)
            
            HStack{
                
                
                ForEach(tags, id: \.self) { tag in
                    Text("#\(tag)").foregroundColor(.white).font(.caption).padding(.top,4).padding(.leading)
                    
                }
            }
            
            
        }.frame( maxWidth: .infinity,alignment: .leading)
        
    }
}


struct Galery:View {
    
    var imgsUrl:[String]
    let formaGrid = [
        
        GridItem(.flexible())
    ]
    
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            
            Text("GALERÍA").foregroundColor(.white).font(.title).padding(.leading)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: formaGrid, spacing: 8) {
                    
                    
                    ForEach(imgsUrl, id: \.self) {
                        imgUrl in
                        
                        
                        KFImage(URL(string: imgUrl)).resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                    }
                    
                }
            }.frame( height: 180)
            
            extraViews()
            
            
        }.frame( maxWidth: .infinity,alignment: .leading)
        
    }
}


struct extraViews:View {
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("COMENTARIOS").foregroundColor(.white).font(.title).padding(.leading)
            
            
            VStack{
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Blue-Gray"))
                        .padding(.horizontal, 8.0)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            
                            Image( "perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 64, height: 64).accentColor(.white).padding([.top, .leading])
                            
                            VStack(alignment: .leading) {
                                Text("Lorem").bold().foregroundColor(Color.white)
                                
                                Text("Hace 18 horas").foregroundColor(Color.white)
                            }
                            
                            
                        }
                        
                        
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor, mauris lorem.  ").foregroundColor(.white).padding(.leading,8)
                            .frame( height: 80)
                        
                        
                    }
                    
                    
                }
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Blue-Gray"))
                        .padding(.horizontal, 8.0)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            
                            Image( "perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 64, height: 64).accentColor(.white).padding([.top, .leading])
                            
                            VStack(alignment: .leading) {
                                Text("Ipsum").bold().foregroundColor(Color.white)
                                
                                Text("Hace 8 horas").foregroundColor(Color.white)
                            }
                            
                            
                        }
                        
                        
                        Text(" Vestibulum auctor, mauris lorem molestie nibh.Lorem ipsum consectetur adipiscing elit.    ").foregroundColor(.white)
                            .padding(.horizontal, 8.0)
                            .frame( height: 80)
                        
                        
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
            Text("JUEGOS SIMILARES").foregroundColor(.white).font(.title).padding(.leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    
                    Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                    
                    
                    
                    
                    Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                    
                    
                    
                    
                    Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                    
                    
                    
                    
                }
            }
            
            
            
            
            
        }
        
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog"
                 ,studio:"Sega"
                 , calificacion:"E+"
                 ,anoPublicacion:"1991"
                 ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
                 , tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
        
        extraViews()
    }
}
