//
//  ContentView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 12/05/21.
//

import SwiftUI



struct ContentView: View {
    
    
    var body: some View {
        
        ZStack{
            
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 100).ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
               Image("AppLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 60.0)
         
                
                InicioYRegistroView()
                
            }
            
        }
    }
}


struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion:Bool = true
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                Spacer()
                
                Button("INICIAR SESIÓN"){
                    
                    print("Pantalla Inicio sesion")
                    tipoInicioSesion = true
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE"){
                    
                    print("Pantalla Registro")
                    tipoInicioSesion = false
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            
            Spacer(minLength: 42)
            
            
            if(tipoInicioSesion){
                InicioSesiónView()
            }else{
                RegistroView()
            }
            
        }
        
    }
}

struct InicioSesiónView: View {
    
   
    var body: some View {
        
        
      
        Text("Pantalla de Inicio de Sesión")
            .foregroundColor(Color.white)
            .padding()
        
    }
    
    
    
    
    
}

struct RegistroView: View {
    var body: some View {
        
       
            Text("Pantalla de Registro")
                .foregroundColor(Color.white)
                .padding()
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}


/*Branches
 //1.- Branch 01 (pantallaModulos): UI de primer parte de la pantalla de iniciar sesion (Imagen logo + botones "Iniciar sesion" y "Registro" )
 

 
 

 
 
 
 */

