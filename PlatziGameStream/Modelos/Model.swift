//
//  Model.swift
//  PlatziGameStream
//
//  Created by Juan Villalvazo on 13/05/21.
//

import Foundation


//Cumplimos con el protocolo Codable para poder codificar y decodificar objetos JSON a tipos que swift pueda comprender y utilizar.

struct Games:Codable {
    var games:[Game]
}

struct Resultados:Codable {
    var results:[Game]
}

struct Game:Codable,Hashable {
    
    
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
        
    
}


struct videoUrl:Codable,Hashable {
   
    var mobile:String
    var tablet:String
    
}





