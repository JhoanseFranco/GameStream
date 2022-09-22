//
//  ViewModel.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 23/08/22.
//

import Foundation
import SwiftUI


class viewModel: ObservableObject{
    
    @Published var gamesInfo = [Game]()
    
    
    init(){
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data{
                    print("el tamaño del Json es: \(jsonData)")
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    //print("decode data \(decodeData)")
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                        //print("GamesInfo 2: \(self.gamesInfo)")
                    }
                    
                }else{
                    print("no existen datos en el json")
                }
            }catch{
                print("Se produjo el siguiente error: \(error)")
            }
        }.resume()
        
    }
    
}
