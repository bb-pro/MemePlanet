//
//  MemeListViewController.swift
//  MemePlanet
//
//  Created by Bektemur Mamashayev on 23/03/23.
//

import UIKit

final class MemeListViewController: UITableViewController {
    
    var memeList: [Meme]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let memeInfoVC = segue.destination as? MemeInfoViewController else {
            return
        }
        guard let indexPath = tableView.indexPathForSelectedRow?.row else { return }
        guard let url = URL(string: memeList[indexPath].url) else { return }
        memeInfoVC.memeName = memeList[indexPath].name
        memeInfoVC.imageUrl = url
    }
}
// MARK: - Table view data source
extension MemeListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memeList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let meme = memeList[indexPath.row]
        content.text = meme.name
        content.image = UIImage(systemName: "smiley")
        cell.contentConfiguration = content
        return cell
    }
}
//MARK: - UITableViewDelegate
extension MemeListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
