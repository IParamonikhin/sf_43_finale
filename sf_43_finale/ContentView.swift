//
//  ContentView.swift
//  sf_43_finale
//
//  Created by Иван on 26.11.2023.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI


struct ContentView: View {
    
    @ObservedObject var obs = Observer()
    
    var body: some View {
        NavigationView {
            List(obs.persons){ person in

                NavigationLink(destination: DetailsView(person: person)){
                    Text("\(person.name)")
                }
            }
            .navigationTitle("Final Space")
        }
    }
}

struct DetailsView: View{
    let person: PersonModel
    var body: some View{
        VStack{
            WebImage(url: URL(string: person.imageURL))
                .cornerRadius(10)
            Text("\(person.species)")
            Text("\(person.gender)")
        }.navigationTitle("\(person.name)")
    }
}

#Preview {
    ContentView()
}


class Observer: ObservableObject{
    
    @Published var persons = [PersonModel]()
    
    init(){
        AF.request(apiURL, method: .get, encoding: JSONEncoding.default, headers:
                    nil).responseJSON { (apiResponse) in
            guard let unwrResponse = apiResponse.value else { return }
            
            let json = JSON(unwrResponse)[]
            
            for i in 0..<json.count {
                let personValues = PersonModel(contactDictionary: json[i])
                self.persons.append(personValues)
            }
        }
    }
}
