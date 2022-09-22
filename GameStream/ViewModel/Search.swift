//
//  Search.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 12/09/22.
//

import Foundation
import SwiftUI

class Search: ObservableObject{
    
    @Published var gameInfo = [Game]()
    
    func searchGame(gameName: String){
        
        gameInfo.removeAll()
        let spacesGame = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string:  "https://gamestream-api.herokuapp.com/api/games/search?contains=\(spacesGame ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data {
                    let decodeData = try JSONDecoder().decode(SearchResults.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                        
                    }
                }else{
                    print("No hay información en la respuesta")
                }
            }catch{
                print("Se ha presentado el siguiente error: \(error)")
            }
        }.resume()
        
    }
    
}
