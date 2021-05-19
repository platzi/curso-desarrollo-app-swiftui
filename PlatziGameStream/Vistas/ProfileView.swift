//
//  ProfileView.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 18/05/21.
//

import SwiftUI

struct ProfileView: View {
    
    
    @State var nombreUsuario:String = "Lorem"
    
    var body: some View {
       
            
        ZStack {
            
            Color("Marine").ignoresSafeArea().navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                    
                  
                    VStack{
                       
                        
                       
                          
                                Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80.0, height: 80.0)
               
                        Text(nombreUsuario)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            

                    }.padding(.vertical, 18)
                
               
                    Text("Ajustes")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading).padding(.leading,18)
                
           
                ModuloAjustes()
             
                Spacer()
            }
            
         
        } .onAppear(
            
            perform: {
                
               print("revisando si tengo datos en user defaults")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    
                    nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                    print("Si encontre nombre de usuario \(nombreUsuario)")
                }else{
                    
                    print("no encontre nombre de usuario guardado en objeto global de userdefaults")
                    
                }
                
            }
        
        
        )
       
   }
    
}


struct ModuloAjustes:View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
        
        
        VStack{
                 
            Button(action: {}, label: {
                    HStack { Text("Cuenta")
                    .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(Color.white)}.padding()
            }) .background(Color("Blue-Gray"))
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {}, label: {
                    HStack { Text("Notificaciones")
                    .foregroundColor(Color.white)
                    Spacer()
                    
                        Toggle("", isOn: $isToggleOn)
                    
                    }.padding()
            }) .background(Color("Blue-Gray"))
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {isEditProfileViewActive = true}, label: {
                    HStack { Text("Editar Perfil")
                    .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(Color.white)}.padding()
            }) .background(Color("Blue-Gray"))
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
           
            Button(action: {}, label: {
                    HStack { Text("Califica esta aplicación")
                    .foregroundColor(Color.white)
                    Spacer()
                    Text(">")
                        .foregroundColor(Color.white)}.padding()
            }) .background(Color("Blue-Gray"))
            .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
                
                
            NavigationLink(
                destination: EditProfileView()
                ,
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
        }
        
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
