//
//  NetworkingService.swift
//  StarWars
//
//  Created by Basila Nathan on 4/13/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetwrokingService {
    static let shared = NetwrokingService()
    
    func getPeople(success successBlock: @escaping (GetPeopleResponse) -> Void) {
        Alamofire.request("https://swapi.co/api/people/").responseJSON { (response) in
            guard let json = response.result.value as? JSON else { return }
            do {
                let getPeopleResponse = try GetPeopleResponse(json: json)
                successBlock(getPeopleResponse)
            } catch {
                
            }
        }
    }
    
    func getHomeworld(homeWorldLink: String, completion: @escaping (String) -> Void) {
        Alamofire.request(homeWorldLink).responseJSON { (response) in
            guard let json = response.result.value as? JSON,
                let name = json["name"] as? String
                else { return }
            completion(name)
        }
    }
}




