//
//  DataManager.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import Foundation

final class DataManager{
    public static func load(_ fileName: String) -> HouseModel {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
                fatalError("Failed to locate \(fileName).json in bundle.")
                
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let housesData = try decoder.decode(HousesData.self, from: data)
                return housesData.data
            } catch {
                 fatalError("Failed to decode \(fileName).json: \(error.localizedDescription)")
            }
    }
}


struct HousesData : Decodable{
    let name: String
    let data : HouseModel
}

