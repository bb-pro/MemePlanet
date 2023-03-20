//
//  Weather.swift
//  Networking(HW)
//
//  Created by Bektemur Mamashayev on 20/03/23.
//
struct Meme: Codable {
    let id: String
    let name: String
    let url: String
    let box_count: Int
}

struct MemeData: Codable {
    let memes: [Meme]
}


struct Response: Codable {
    let success: Bool
    let data: MemeData
}
