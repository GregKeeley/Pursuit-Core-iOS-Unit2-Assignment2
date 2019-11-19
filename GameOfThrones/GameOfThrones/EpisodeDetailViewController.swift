//
//  EpisodeDetailViewController.swift
//  GameOfThrones
//
//  Created by Gregory Keeley on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeDescription: UITextView!
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeDescription.isEditable = false

    }
}
