//
//  FavoritesView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 16/05/21.
//


import SwiftUI


struct FavoritesView:View {
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @ObservedObject var objJuegosFavoritos = FavoritesGames()
    @State var  titulosJuegosFavoritos:[String] = [""]
    @State var isGameViewActive:Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    
    
    
    
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
                    
                    
                    VStack(alignment:.leading){
                        
                        ForEach(titulosJuegosFavoritos, id: \.self) {
                            tituloJuego in
                            
                            Button(action: {
                                
                                watchGame(name: tituloJuego)
                                
                            },  label: {
                                
                                HStack {
                                    
                                    Text(tituloJuego).foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "play.fill").padding(.trailing,10)
                                }
                                
                            }).padding(.bottom,8)
                            
                        }
                        
                        
                    }
                    
                    
                }.padding(.bottom,8)
                
                
                
            }.padding(.horizontal,6)
            
            
            NavigationLink(
                destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
                isActive: $isGameViewActive,
                label: {
                    EmptyView()
                })
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            
            titulosJuegosFavoritos = objJuegosFavoritos.recuperarTitulosFavoritos()
            
            
            print(titulosJuegosFavoritos)
            
            
            
        })
        
    }
    
    
    
    func watchGame(name:String)  {
        
        juegoEncontrado.search(gameName: name)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            if juegoEncontrado.gameInfo.count == 0{
                
                print("No se encontro ningun juego llamado \(name)")
                
                
                
            }else{
                
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                
                isGameViewActive = true
            }
        }
        
        
        
        
    }
    
    
    
}



struct FavoritesView_Previews: PreviewProvider {

@ObservedObject var todosLosVideojuegos = ViewModel()
    static var previews: some View {


        FavoritesView()
    }
}






