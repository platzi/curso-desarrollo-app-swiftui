//
//  GamesView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 13/05/21.
//

import SwiftUI
import Kingfisher

struct GamesView:View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    @State var gameviewIsActive:Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    let formaGrid = [
        
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View{
        
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            VStack() {
                
                
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 9.0)
                
                ScrollView{
                    
                    LazyVGrid(columns: formaGrid, spacing: 8) {
                        
                        
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self) {
                            juego in
                            
                            Button(action: {
                                
                                
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                descripcion = juego.description
                                tags = juego.tags
                                imgsUrl = juego.galleryImages
                                
                                gameviewIsActive = true
                                //print("Pulse Imagen: \(juego.title)")
                            },  label: {
                                
                                KFImage(URL(string: juego.galleryImages[0])!).resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                
                                
                                
                            })
                        }
                        
                    }
                    
                    
                }
                
                
                
            }.padding(.horizontal,6)
            
            
            NavigationLink(
                destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
                isActive: $gameviewIsActive,
                label: {
                    EmptyView()
                })
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(perform: {
            
            //Muestra la información del primer elemento del json
            print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
            print("Titulo del primer elemento del json: \(todosLosVideojuegos.gamesInfo[0].title)")
        })
        
        
    }
}



//struct GamesView_Previews: PreviewProvider {

//@ObservedObject var todosLosVideojuegos = ViewModel()
//    static var previews: some View {
//        
//        
//        GamesView()
//    }
//}



//Idea para busquedas por plataforma: Se puede desactivar y activar el lazygrid con una propiedad @state al momento de pulsar una de las opciones el drawer y despues se vuelve a activar pero con otra propiedad state de


