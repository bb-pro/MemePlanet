//
//  MemeInfoViewController.swift
//  MemePlanet
//
//  Created by Bektemur Mamashayev on 24/03/23.
//

import UIKit

final class MemeInfoViewController: UIViewController {
    
    @IBOutlet var memeImageView: UIImageView!
    @IBOutlet var memeLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var imageUrl: URL!
    var memeName: String!
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        fetchImage()
    }
    
    @IBAction func shareAction() {
//        let shareActivityController = UIActivityViewController(
//            activityItems: [dogImage!],
//            applicationActivities: nil)
//        present(shareActivityController, animated: true)
    }
    
}

private extension MemeInfoViewController {
    func fetchImage() {
        networkManager.fetchImage(from: imageUrl) { [weak self] result in
            switch result {
            case .success(let image):
                self?.memeImageView.image = UIImage(data: image)
                self?.memeLabel.text = self?.memeName
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
