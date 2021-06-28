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
    
    
    
    var body: some View{
        
        VStack{
            
            HStack{
                Text("INICIA SESION")
                Text("REGÍSTRATE")
                
            }
            
            
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
    }
}




