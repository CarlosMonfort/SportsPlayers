//
//  PlayerTableViewCell.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var ivPlayer: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSurname: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    // MARK: - Variables
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var player: Player! {
        didSet {
            setUpCell()
        }
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell() {
        configLabel(label: lbName, with: player.name)
        configLabel(label: lbSurname, with: player.surname)
        configDateLabel(with: player.date)
        
        ivPlayer.kf.indicatorType = .activity
        let url = URL(string: player.image)
        ivPlayer.kf.setImage(with: url)
    }
    
    func configLabel(label: UILabel, with text: String) {
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
    }
    
    func configDateLabel(with text: String?) {
        lbDate.text = text ?? ""
        lbDate.font = UIFont.preferredFont(forTextStyle: .subheadline)
        lbDate.lineBreakMode = .byWordWrapping
        lbDate.numberOfLines = 0
    }

}
