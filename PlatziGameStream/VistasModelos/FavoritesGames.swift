//
//  FavoritesGames.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 16/05/21.
//

import Foundation

class FavoritesGames: ObservableObject {
 
    // Access Shared Defaults Object
    let userDefaults = UserDefaults.standard

    
    
    
    var canvasTitulosFavoritos:[String] = []
    var titulosFavoritos:[String] = []
    
    var canvasFavoritos:[String] = []
    var favoritos:[String] = []
    
    func guardarFavorito(title:String,titulo:String) {
        
        
        //si nunca he guardado, guarda por primera vez un titulo
        if recuperarTitulosFavoritos().count == 0 {
            
            canvasTitulosFavoritos.append(title)
            userDefaults.set(canvasTitulosFavoritos, forKey: "tituloMisFavoritos")

        }else{
            
            canvasTitulosFavoritos = titulosFavoritos
            canvasTitulosFavoritos.append(title)
            userDefaults.set(canvasTitulosFavoritos, forKey: "tituloMisFavoritos")
        }
        
        
        
        //si nunca he guardado imagenes, guarda por primera vez un url imagenes
        
        if recuperarFavoritos().count == 0 {
          
            canvasFavoritos.append(titulo)
            userDefaults.set(canvasFavoritos, forKey: "misFavoritos")

        }else{
            
            canvasFavoritos = favoritos
            canvasFavoritos.append(titulo)
            userDefaults.set(canvasFavoritos, forKey: "misFavoritos")
        }
        
        
    }
    
    
    func recuperarTitulosFavoritos() -> [String] {
        //recuperar titulos
         if userDefaults.object(forKey: "tituloMisFavoritos") != nil  {
             titulosFavoritos = userDefaults.object(forKey: "tituloMisFavoritos") as! [String]
             return titulosFavoritos
         }else{
             
             return []
             
         }
    }
    
    func recuperarFavoritos() -> [String]{
        
      
        //recuperar Url de imagenes
        if userDefaults.object(forKey: "misFavoritos") != nil  {
        favoritos = userDefaults.object(forKey: "misFavoritos") as! [String]
            return favoritos
        }else{
            
            return []
            
        }
   
    }
    

}

