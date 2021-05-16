//
//  FavoritesView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 16/05/21.
//
 

import SwiftUI
import Kingfisher

struct FavoritesView:View {
    
    @ObservedObject var videojuegosFavoritos = FavoritesGames()
    @State var gameviewIsActive:Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    @State var favoritos:[String] = ["Cuphead"]
    @State var i:Int = 0
    
    let formaGrid = [
        
        GridItem(.flexible())
    ]
    
    
    var body: some View{
        
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            VStack() {
                
                
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 9.0)
                
                ScrollView{
                    
                    LazyVGrid(columns: formaGrid, spacing: 8) {
                        
                        //if juego.title.contains("Cuphead") crear arreglo con titulos de mis preferidos y luego crear nuevo arreglos de todos los juegos.info en mi model y ese usar aqui abajo.
                        ForEach(videojuegosFavoritos.gamesInfo, id: \.self) {
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
                    
                    
                }.padding(.bottom,8)
                
                
                
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



