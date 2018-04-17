//
//  DataService.swift
//  ComplexNestedData
//
//  Created by Basila Nathan on 4/17/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]


class DataService {
    
    //To maintain a singleton's unique-ness, the initializer of a singleton needs to be private. This helps to prevent other objects from creating instances of your singeton class themselves
    private init() {}
    
    static let shared = DataService()
    
    func getData(completion: (Data) -> Void ) {
        guard let path = Bundle.main.path(forResource: "ComplexJSON", ofType: "txt") else { return }
        let url = URL(fileURLWithPath: path)
        //debugPrint(url)
        do {
            let data = try Data(contentsOf: url)
            completion(data) //data that will be passed into the callback
        } catch {
            debugPrint(error)
        }
    }
}
