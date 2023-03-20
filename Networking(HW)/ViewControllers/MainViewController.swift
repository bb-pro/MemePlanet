//
//  ViewController.swift
//  Networking(HW)
//
//  Created by Bektemur Mamashayev on 20/03/23.
//

import UIKit

final class MainViewController: UIViewController {
    private let memeUrl = "https://api.imgflip.com/get_memes"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMemes()
    }
}

//MARK: - Networking
private extension MainViewController {
    func fetchMemes() {
        guard let url = URL(string: memeUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(Response.self, from: data)
                let memes = response.data.memes
                print("Total number of memes: \(memes.count)")
                //print(memes)
                guard let meme = memes.randomElement() else { return }
                print("Random Meme: \(meme)")
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
