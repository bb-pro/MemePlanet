//
//  ViewController.swift
//  Networking(HW)
//
//  Created by Bektemur Mamashayev on 20/03/23.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let memeUrl = URL(string: "https://api.imgflip.com/get_memes")!
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMemes()
    }
}

//MARK: - Networking
private extension MainViewController {
    func fetchMemes() {
        networkManager.fetch(Response.self, from: memeUrl) { result in
            switch result {
            case .success(let meme):
                print(meme)
            case .failure(let error):
                print(error)
            }
        }
    }
}
