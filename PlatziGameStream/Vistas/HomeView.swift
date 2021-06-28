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
                        
                 
                    Text("Juegos")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
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
    
   
    
    @State var textoBusqueda:String = ""
    
    var body: some View{
        
        
        ZStack{
        
            Color("Marine").ignoresSafeArea()
            
           
            
            VStack{
                
               
                
               Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.vertical, 11.0)
                
                
            
                
                HStack {
                   
                    Button(action: buscar, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("Amarello") : Color("Dark-Cyan") )
                    })
                    
                    
                ZStack(alignment: .leading){
                       
                  
                    
                      if textoBusqueda.isEmpty { Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                   
                   
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                    
                    }
                
                
                
                
                }.padding([.top, .leading, .bottom], 11.0)
                .background(Color("Blue-Gray"))
                .clipShape(Capsule())
                
                    
                ScrollView(showsIndicators: false){
                SubModuloHome()
                    
                }//.clipped()
                
   
            }.padding(.horizontal, 18.0)
            

        
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
 
        
    }
    
 
    
    func buscar() {
        print("Buscando video que contenga \(textoBusqueda)")
    }
    
//    func navegarVideoPLayerView(videoUrl:String){
//
//
//
//
//    }
    
}


struct SubModuloHome:View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        
      //1
        VStack{
           
          //2
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white).bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
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
                
                
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
            .padding(.vertical)
            
           
            
        }
        
        NavigationLink(
            destination: VideoPlayer(player:
                    AVPlayer(url:  URL(string: url)!))
                    .frame(width: 400, height: 300)
                ,
            isActive: $isPlayerActive,
            label: {
               
                
                EmptyView()
            })
        
        
    }





}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
