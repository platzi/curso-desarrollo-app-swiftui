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

    
    
    var canvasFavoritos:[String] = [""]
    var favoritos:[String] = [""]
    
    func guardarFavorito(titulo:String) {
        
        
        
        //si nunca he guardado, guarda por primera vez un titulo
        if recuperarFavoritos().count == 0 {
            canvasFavoritos.append(titulo)
        userDefaults.set(canvasFavoritos, forKey: "misFavoritos")

        }else{
            canvasFavoritos = favoritos
            canvasFavoritos.append(titulo)
            userDefaults.set(canvasFavoritos, forKey: "misFavoritos")
        }
        
        
    }
    
    func recuperarFavoritos() -> [String]{
        
        // Read/Get Array of Strings
        
        if userDefaults.object(forKey: "misFavoritos") != nil  {
        favoritos = userDefaults.object(forKey: "misFavoritos") as! [String]
            return favoritos
        }else{
            
            return [""]
            
        }
        
        
        
    }
    

}

