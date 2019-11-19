//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var episodes = [GOTEpisode]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        episodes = GOTEpisode.allEpisodes
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDVC = segue.destination as? EpisodeDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("did not prepare for segue correctly")
        }
        let episode = episodes[indexPath.row]
        episodeDVC.episode = episode
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? Left_TableViewCell else {
            fatalError("Failed to dequeue for LeftCell")
        }
        let episode = episodes[indexPath.row]
        cell.configureCell(for: episode)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 
    }
}
