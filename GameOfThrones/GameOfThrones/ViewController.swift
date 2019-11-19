//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    var episodes = [GOTEpisode]()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? Left_TableViewCell else {
            fatalError("Failed to dequeue for LeftCell")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
}
