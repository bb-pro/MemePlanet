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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var buttonsStackView: UIStackView!
    
    private let memeUrl = URL(string: "https://api.imgflip.com/get_memes")!
    private let networkManager = NetworkManager.shared
    private var response: Response!
    private var randomMeme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        updateUI()
        
        
        
    }
    
    
    @IBAction func randomMemeButtonPressed() {
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let memeListVC = segue.destination as? MemeListViewController else { return }
        memeListVC.memeList = response.data.memes
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
                self?.fetchImage()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchImage() {
        guard let url = URL(string: randomMeme.url) else { return }
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.memeImageView.image = UIImage(data: image)
                self?.buttonsStackView.isHidden = false
                self?.memeLabel.text = self?.randomMeme.name
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateUI() {
        activityIndicator.startAnimating()
        fetchMemes()
    }
}
