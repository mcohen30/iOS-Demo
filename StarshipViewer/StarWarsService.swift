//
//  StarWarsService.swift
//  StarshipViewer
//
//  Created by Mazlow Cohen on 4/9/18.
//  Copyright © 2018 Mazlow Cohen. All rights reserved.
//

import Foundation

struct API {
    
    let starships: URL
    
    init(baseURL: URL){
        starships = baseURL.appendingPathComponent("starships")
        
    }
    
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

struct StarWarsService {
    
    let api = API(baseURL: URL(string: "https://swapi.co/api/")!)
    
    func getStarships(completion: @escaping (Result<[Starship]>) -> Void){
        
        let request = URLRequest(url:api.starships)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error{
                completion(.failure(error))
            } else if let data = data{
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let starships = try decoder.decode(Starships.self, from: data)
                    completion(.success(starships.results))
                    
                } catch {
                    completion(.failure(error))
                }
                
            }else{
                fatalError()
            }
        
        }
        
        task.resume()
    }
    
}
