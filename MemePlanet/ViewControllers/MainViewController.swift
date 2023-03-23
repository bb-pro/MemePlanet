//
//  ViewController.swift
//  Networking(HW)
//
//  Created by Bektemur Mamashayev on 20/03/23.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var memeImageView: UIImageView!
    @IBOutlet var memeLabel: UILabel!
    
    private let memeUrl = URL(string: "https://api.imgflip.com/get_memes")!
    private let networkManager = NetworkManager.shared
    private var response: Response!
    private var randomMeme: Meme!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMemes()
    }
}

//MARK: - Networking
private extension MainViewController {
    func fetchMemes() {
        networkManager.fetch(Response.self, from: memeUrl) { [weak self] result in
            switch result {
            case .success(let data):
                self?.response = data
                self?.randomMeme = self?.response.data.memes.randomElement()
                self?.memeLabel.text = self?.randomMeme.name
                self?.fetchImage()
            case .failure(let error):
                print(error)
            }
        }
    }
    func fetchImage() {
        guard let url = URL(string: randomMeme.url) else { return }
        networkManager.fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                self.memeImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
