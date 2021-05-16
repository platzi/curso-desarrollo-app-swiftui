//
//  SearchGame.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 15/05/21.
//

import Foundation

class SearchGame: ObservableObject {
 
// 1.
 
  @Published var gameInfo = [Game]()
 
    
    
    func search(gameName:String) {
       
        gameInfo.removeAll()
        
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 2.
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if let jsonData = data {
                    // 3.
                    print("tamañoJSON: \(jsonData)")
                    
                    let decodedData = try JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    print("JSONDecodificado: \(decodedData)")
                    
                 
                    
                    DispatchQueue.main.async {
                        //Llenar propiedad games info con el arreglo de datos decodificados de nuestro json original
                        
         
                            self.gameInfo.append(contentsOf: decodedData.results)}
              
                    
                } else {
                    print("No existen datos en el json recuperado")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
      
      
    
    }
    

}

