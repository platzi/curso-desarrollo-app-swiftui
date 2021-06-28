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
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    
    var body: some View {
        
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                Text("Correo electrónico")
                    .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                
                ZStack(alignment: .leading){
                    if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    TextField("", text: $correo)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if contraseña.isEmpty { Text("Escribe tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $contraseña)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                
               
                
                
            }.padding(.horizontal, 77.0)
        }
        

        
    }
    
   
    
    
}

struct RegistroView: View {
    var body: some View {
        
       
            Text("Pantalla de Registro")
                //.foregroundColor(Color.white)
                //.padding()
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}







