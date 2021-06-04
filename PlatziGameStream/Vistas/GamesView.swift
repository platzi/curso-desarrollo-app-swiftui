//
//  GamesView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 13/05/21.
//

import SwiftUI

struct GamesView:View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
    
        GridItem(.flexible()),
        GridItem(.flexible())
    
    ]
    
    var body: some View{
        
        
        ZStack{
         
            Color("Marine").ignoresSafeArea()
            
            
            VStack{
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    
                    
                    LazyVGrid(columns:formaGrid,spacing:8){
                        
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                            
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
                     
                                print("Pulse el juego \(titulo)")
                                
                               
                                
                                
                            }, label: {
                                
                                
                                Text("\(juego.title)")
                                
                                
                            
                            })
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
            }.padding(.horizontal,6)
            
            
            
            
            
            
           
            
            
            
            
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
            .onAppear(perform: {
            
            //Muestra la información del primer elemento del json
            print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
            print("Titulo del primer elemento del json: \(todosLosVideojuegos.gamesInfo[0].title)")
        })
        
    }
}

