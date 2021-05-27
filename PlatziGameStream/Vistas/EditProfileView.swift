//
//  EditProfileView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 18/05/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            ScrollView{
                    
                  
                    VStack(alignment: .center){
                       
                        
                            
                        
                        Button(action: {}, label: {
                            ZStack{
                                
                                Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fill)
                                    .frame(width: 118.0, height: 118.0)
                                    .clipShape(Circle())
                                
                                Image(systemName: "camera").foregroundColor(.white)
               
                                
                            }
                        })
                        
                        

                    }.padding(.bottom, 18.0)
                    
                  ModuloEditar()
            }
        }
    }
}


struct ModuloEditar:View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var nombre:String = ""
   
    var body: some View{
        
        
        VStack(alignment: .leading){
            
            Text("Correo electrónico")
                .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
            
            ZStack(alignment: .leading){
                if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                
                TextField("", text: $correo).foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan")).padding(.bottom)
            
            
            Text("Contraseña").foregroundColor(.white)
            
            
            ZStack(alignment: .leading){
                if contraseña.isEmpty { Text("Introduce tu nueva contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                
                SecureField("", text: $contraseña).foregroundColor(.white)
                
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan")).padding(.bottom)
            
            Text("Nombre").foregroundColor(.white)
            
            
            ZStack(alignment: .leading){
                if nombre.isEmpty { Text("Introduce tu nombre de usuario").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                
                TextField("", text: $nombre).foregroundColor(.white)
                
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan")).padding(.bottom,32)
            
            Button(action:{ actualizarDatos()}) {
                Text("Actualizar Datos")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame( maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color("Dark-Cyan"), lineWidth: 3).shadow(color: .white, radius: 6))
            }.padding(.bottom)
            

            
            
       
            
        }.padding(.horizontal, 42.0)
        
        
    }
    
    func actualizarDatos()  {
        let objetoActualizadorDatos = SaveData()
        
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contrasena: contraseña, nombre: nombre)
        
        print("Se guardaron los datos con exito?: \(resultado)")
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
