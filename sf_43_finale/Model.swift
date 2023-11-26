//
//  Model.swift
//  sf_43_finale
//
//  Created by Иван on 26.11.2023.
//

import Foundation
import SwiftyJSON
//import Alamofire


let initialURL = "https://finalspaceapi.com/api/"
let apiURL = initialURL + "v0/character/"
typealias GetComplete = () -> ()

class PersonModel : Identifiable{
    var id: String
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: String
    var imageURL: String
    
    
    init(contactDictionary: JSON) {
        self.id = contactDictionary[ "id"].stringValue
        self.name = contactDictionary["name"].stringValue
        self.status = contactDictionary["status"].stringValue
        self.species = contactDictionary["species"].stringValue
        self.gender = contactDictionary["gender"].stringValue
        self.origin = contactDictionary["origin"].stringValue
        self.imageURL = contactDictionary["img_url"].stringValue
    }
    
}
