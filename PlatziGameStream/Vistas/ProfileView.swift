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
                    
                Text("Perfil").fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .padding()
                  
                    VStack{
                       
                        
                       
                          
                                Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fill)
                                    .frame(width: 118.0, height: 118.0)
                                    .clipShape(Circle())
               
                       // Text(nombreUsuario)
                        //    .fontWeight(.bold)
                          //  .foregroundColor(Color.white)
                            

                    }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
               
                    Text("Ajustes")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading).padding(.leading,18)
                
           
                ModuloAjustes()
             
               
            }
            
         
        }.onAppear(
            
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
    
    
    
    var body: some View{
        
        
       Text("Hola")
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
