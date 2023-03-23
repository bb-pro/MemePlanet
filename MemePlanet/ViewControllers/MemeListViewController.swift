//
//  MemeListViewController.swift
//  MemePlanet
//
//  Created by Bektemur Mamashayev on 23/03/23.
//

import UIKit

final class MemeListViewController: UITableViewController {
    
    var memeList: [Meme]!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(memeList.count)
        return memeList.count
    }
    
}
