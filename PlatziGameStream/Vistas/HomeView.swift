//
//  HomeView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 13/05/21.
//


import SwiftUI
import AVKit

struct HomeView: View {
    
    
    
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        
        
        
        TabView(selection:$tabSeleccionado) {
            
            
            
            ProfileView().navigationBarHidden(true).navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            
            Home().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
            
 
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
            
           
            
            
            
            
            
        }
        .accentColor(.white)
        
   
        
    }
    
    
    init() {
        
        UITabBar.appearance().barTintColor = UIColor (Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
       
    }
    
}



struct Home:View {
    
    
    
    
    var body: some View{
        
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            
            
            VStack{
                
                
                
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.vertical, 11.0)
                
                
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                    
                }
                
                
            }.padding(.horizontal, 18.0)
            
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
        
        
        
        
        
        
    }
    
    
    
}


struct SubModuloHome:View {
    
    @State var textoBusqueda:String = ""
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    
    
    
    var body: some View{
        
        VStack{
            
            
            
            HStack {
                
                Button(action: {watchGame(name: textoBusqueda)}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("Amarello") : Color("Dark-Cyan") )
                }).alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                }
                
                
                ZStack(alignment: .leading){
                    
                    
                    
                    if textoBusqueda.isEmpty { Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                    
                    
                }
                
                
                
                
            }.padding([.top, .leading, .bottom], 11.0)
            .background(Color("Blue-Gray"))
            .clipShape(Capsule())
            
            
            
            
            
            
            
            
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                
                
                Button( action: {watchGame(name: "The Witcher 3")}, label: {
                    
                    VStack(spacing: 0) {
                        
                        Image("The Witcher 3").resizable().scaledToFill()
                        
                        
                        Text("The Witcher 3: Wild Hunt").frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading).background(Color("Blue-Gray"))
                        
                        
                        
                    }
                    
                    
                })
                
                
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42.0, height: 42.0)
                
            }.frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
            .padding(.vertical)
            
            
            Text("CATEGORÍAS SUGERIDAS PARA TI").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("FPS").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("OpenWorld").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                }
            }
            
            Text("RECOMENDADOS PARA TI").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {watchGame(name: "Abzu")}, label: {
                        
                        
                        
                        Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    Button(action: {watchGame(name: "Crash Bandicoot")}, label: {
                        
                        
                        
                        Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    
                    Button(action: {watchGame(name: "DEATH STRANDING")}, label: {
                        
                        
                        
                        Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                }
            }
            
            
            
            Text("VIDEOS QUE PODRIAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {watchGame(name: "Cuphead")}, label: {
                        
                        
                        
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    Button(action: {watchGame(name: "Hades")}, label: {
                        
                        
                        
                        Image("Hades").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    
                    Button(action: {watchGame(name: "Grand Theft Auto V")}, label: {
                        
                        
                        
                        Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                }
            }
            
            
            // para agregar insets a scrollview
            Color.clear.frame(width: 1, height: 8, alignment: .center)
            
            
        }
        
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)
            ,
            isActive: $isGameViewActive,
            label: {
                
                
                EmptyView()
            })
        
        
        
        
    }
    
    
    
    
    
    func watchGame(name:String)  {
        
        juegoEncontrado.search(gameName: name)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            if juegoEncontrado.gameInfo.count == 0{
                
                print("No se encontro ningun juego llamado \(name)")
                
                isGameInfoEmpty = true
                
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
