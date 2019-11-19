//
//  Left_TableViewCell.swift
//  GameOfThrones
//
//  Created by Gregory Keeley on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class Left_TableViewCell: UITableViewCell {

    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!

    func configureCell(for episode: GOTEpisode) {
        episodeTitleLabel.text = episode.name
        episodeNumberLabel.text = episode.number.description
        seasonNumberLabel.text = episode.season.description
        episodeImage.image = UIImage(named: episode.mediumImageID)
    }
}
