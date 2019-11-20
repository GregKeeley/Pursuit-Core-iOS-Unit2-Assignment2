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
    var episodes = [[GOTEpisode]]() {
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
        episodes = GOTEpisode.getSeasons()
        print(episodes)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDVC = segue.destination as? EpisodeDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("did not prepare for segue correctly")
        }
        let episode = episodes[indexPath.section][indexPath.row]
        episodeDVC.episode = episode
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (episodes[indexPath.section][indexPath.row].season) % 2 == 0 {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? Left_TableViewCell else {
            fatalError("Failed to dequeue for LeftCell")
        }
        let episode = episodes[indexPath.section][indexPath.row]
        cell.configureCell(for: episode)
            return cell
                
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? Right_TableViewCell else {
                fatalError("Failed to dequeue for rightCell")
            }
            let episode = episodes[indexPath.section][indexPath.row]
            cell.configureCell(for: episode)
                return cell
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodes.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ("Season\(episodes[section].first?.season.description ?? "0")")
    }
}
