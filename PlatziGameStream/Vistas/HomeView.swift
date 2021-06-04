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
                   
                    
                    
                    Text("Perfil")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
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
                    
                    
                   
                    
                   
                    Text("Favoritos")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favoritos")
                        }.tag(3)
                    
                    Text("Buscar")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Buscar")
                        }.tag(4)
    
                 
                    
                 
                   
                }
                .accentColor(.white)
                
                
                
                
                
     
         
    }
    
    
    init() {
        
        UITabBar.appearance().barTintColor = UIColor (Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        print("popular vistas")
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
                    
                }//.clipped()
                
   
            }.padding(.horizontal, 18.0)
            

        
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
       
        
        
        
        
        
    }
    
 
    
//    func buscar() {
//        print("Buscando video que contenga \(textoBusqueda)")
//    }
    
    func navegarVideoPLayerView(videoUrl:String){
        
        
        
        
    }
    
}


struct SubModuloHome:View {
   
    @State var isGameInfoEmpty = false
    @State var textoBusqueda:String = ""
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        VStack{
            
            
            HStack{
               
              
                Button(action:{
                    
                    
                    watchGame(name:textoBusqueda)
                    
                    
                    
                }   , label: {
                  
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cyan")
                    )
                }).alert(isPresented: $isGameInfoEmpty){
                    
                    
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                    
                }
                
                
                
                
                
                ZStack(alignment:.leading){
                    
                    
                    if textoBusqueda.isEmpty{
                        
                        Text("Buscar un video").foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))

                    }
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                    
                    
                    
                }
                
                
                
            }.padding([.top,.leading, .bottom], 11.0 )
            .background(Color("Blue-Gray"))
            .clipShape(Capsule())
            
            
            
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                
                
                Button(action:{ url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    
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
                    
                    Button(action: {url = urlVideos[1]
                            
                            isPlayerActive = true}, label: {
                        
                        
                        
                        Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    Button(action: {url = urlVideos[2]
                            
                            isPlayerActive = true}, label: {
                        
                        
                        
                        Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    
                    Button(action: {url = urlVideos[3]
                            
                            isPlayerActive = true}, label: {
                        
                        
                        
                        Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                }
            }
            
            
            
            Text("VIDEOS QUE PODRIAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {url = urlVideos[4]
                            
                            isPlayerActive = true}, label: {
                        
                        
                        
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    Button(action: {url = urlVideos[5]
                            
                            isPlayerActive = true}, label: {
                        
                        
                        
                        Image("Hades").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    
                    Button(action: {url = urlVideos[6]
                            
                            isPlayerActive = true}, label: {
                        
                        
                        
                        Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                }
            }
            
          
            // para agregar insets a scrollview
            Color.clear.frame(width: 1, height: 8, alignment: .center)
            
            
        }
      
        
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url:  URL(string: url)!)).frame(width: 400, height: 300)
                ,
            isActive: $isPlayerActive,
            label: {
               
                
                EmptyView()
            })
        
        
    }


    func watchGame(name:String)  {
    
       print("Buscar Juego")
        isGameInfoEmpty = true
        
    
    }
    


}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

