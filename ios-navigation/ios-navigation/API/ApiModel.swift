//
//  PlanetInfo.swift
//  ios-navigation
//
//  Created by Игорь Викторов on 16.12.2022.
//

import Foundation

struct PlanetInfo: Decodable {
    var name: String
    var dayLength: String
    var residents: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case dayLength = "orbital_period"
        case residents
    }
}

struct PeopleName: Decodable {
    var name: String
}

func getTODOItem(completion: ((_ todoItemTitle: String?) -> ())?) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/55")

    let task = URLSession.shared.dataTask(with: url!) { data, response, error in

        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }

        if (response as! HTTPURLResponse).statusCode != 200 {
            print("Status code != 200, statusCode = \((response as! HTTPURLResponse).statusCode)")
            completion?(nil)
            return
        }

        guard let data else {
            print("data = nil")
            completion?(nil)
            return
        }

        do {
            let answer  = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            if let todoItemTitle = answer?["title"] as? String {
                completion?(todoItemTitle)
                return
            }
        } catch {
            print(error)
        }

        completion?(nil)
    }
    task.resume()
}


func getPlanetDayLength(completion: ((_ planetItem: PlanetInfo?) -> ())?) {
    let url = URL(string: "https://swapi.dev/api/planets/1")

    let task = URLSession.shared.dataTask(with: url!) { data, response, error in

        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }

        if (response as! HTTPURLResponse).statusCode != 200 {
            print("Status code != 200, statusCode = \((response as! HTTPURLResponse).statusCode)")
            completion?(nil)
            return
        }

        guard let data else {
            print("data = nil")
            completion?(nil)
            return
        }

        do {
            let answer = try JSONDecoder().decode(PlanetInfo.self, from: data)
            completion?(answer)
            return
        } catch {
            print(error)
        }

        completion?(nil)
    }
    task.resume()
}


func getPlanetResidentName(peopleURL: String, completion: ((_ peopleName: PeopleName?) -> ())?) {
    let url = URL(string: peopleURL)

    let task = URLSession.shared.dataTask(with: url!) { data, response, error in

        if let error {
            print(error.localizedDescription)
            completion?(nil)
            return
        }

        if (response as! HTTPURLResponse).statusCode != 200 {
            print("Status code != 200, statusCode = \((response as! HTTPURLResponse).statusCode)")
            completion?(nil)
            return
        }

        guard let data else {
            print("data = nil")
            completion?(nil)
            return
        }

        do {
            let answer = try JSONDecoder().decode(PeopleName.self, from: data)
            completion?(answer)
            return
        } catch {
            print(error)
        }

        completion?(nil)
    }
    task.resume()
}
