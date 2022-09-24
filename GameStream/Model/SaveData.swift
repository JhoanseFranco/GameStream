//
//  SaveData.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 22/09/22.
//

import Foundation

class SaveData{
        
    func saveData(email: String, password: String, name: String) {
        UserDefaults.standard.set([email, password, name], forKey: "UserData")
        if let userData = UserDefaults.standard.object(forKey: "UserData"){
            print("Datos almacenados exitosamente \(userData)")
        }else{
            print("No fueron guardados los datos")
        }
    }
    
    func getUserData() -> [String]{
        if let dataUserSaved: [String] = UserDefaults.standard.stringArray(forKey: "UserData"){
            return dataUserSaved
        }else{
            return [""]
        }
    }
    
    func validateUser(email: String, password: String) -> Bool{
        guard let userData = UserDefaults.standard.stringArray(forKey: "UserData") else {
            return false
        }
        if userData[0] == email && userData[1] == password{
            return true
        }else{
            return false
        }
    }
}
