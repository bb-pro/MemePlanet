//
//  Weather.swift
//  Networking(HW)
//
//  Created by Bektemur Mamashayev on 20/03/23.
//
struct Meme: Decodable {
    let id: String
    let name: String
    let url: String
}

struct MemeData: Decodable {
    let memes: [Meme]
}

struct Response: Decodable {
    let success: Bool
    let data: MemeData
}
