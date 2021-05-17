//
//  FavoritesGames.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 16/05/21.
//

import Foundation

class FavoritesGames: ObservableObject {
 
    // Accede al objeto default compartido(espacio de memoria asignado para guardar pequeñas cantidades de datos)
    
    let userDefaults = UserDefaults.standard

    var canvasTitulosFavoritos:[String] = []
    var titulosFavoritos:[String] = []
   
    
    func guardarFavorito(titulo:String) {
        
        
        //si nunca he guardado, guarda por primera vez un titulo
        if recuperarTitulosFavoritos().count == 0 {
            
            canvasTitulosFavoritos.append(titulo)
            userDefaults.set(canvasTitulosFavoritos, forKey: "tituloMisFavoritos")

        }else{
            
            canvasTitulosFavoritos = titulosFavoritos
            canvasTitulosFavoritos.append(titulo)
            userDefaults.set(canvasTitulosFavoritos, forKey: "tituloMisFavoritos")
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
    
  
    

}

