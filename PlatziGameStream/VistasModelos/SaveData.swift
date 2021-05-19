//
//  SaveData.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 18/05/21.
//

import Foundation

class SaveData {
    var correo:String = ""
    var contrasena:String = ""
    var nombre:String = ""
    
    
    
    func guardarDatos(correo:String,contrasena:String,nombre:String) -> Bool {
        
        print("Dentro de funcion Guardar Datos obtuve: \(correo) + \(contrasena) + \(nombre)")
        UserDefaults.standard.set([correo,contrasena,nombre], forKey: "datosUsuario")
        
        return true
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en metodo recuperar datos y recupere: \(datosUsuario)")
        
        return datosUsuario
    }
    
    
    func validar(correo:String,contrasena:String) -> Bool {
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("revisando si tengo datos en user defaults con correo: \(correo) y contraseña: \(contrasena)")
        
        
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo guardado es: \(correoGuardado) y la contraseña guardada es: \(contraseñaGuardada)")
            
            if (correo == correoGuardado && contrasena == contraseñaGuardada){
                return true
            }else{
                return false
            }
              
        }else{
            
            print("No hay datos de usuario grabados en el objeto global de userdefaults")
            return false
        }
        
    }
    
}
