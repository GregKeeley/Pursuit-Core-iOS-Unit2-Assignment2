//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var searchResults = [String]()
    
    
    var episodes = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        tableView.backgroundColor = .lightGray
        searchBar.delegate = self
    }
    
    func loadData() {
        episodes = GOTEpisode.getSeasons()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDVC = segue.destination as? EpisodeDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("did not prepare for segue correctly")
        }
        let episode = episodes[indexPath.section][indexPath.row]
        episodeDVC.episode = episode
        episodeDVC.titleBar.title = episode.name
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
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchResults = episodes.filter ({$0.prefix(searchText.count) == searchText})
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
