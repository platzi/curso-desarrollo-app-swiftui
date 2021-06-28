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
    
  
   
    var body: some View{
        
        
      Text("Modulo Editar")
        
        
    }
    
  
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
