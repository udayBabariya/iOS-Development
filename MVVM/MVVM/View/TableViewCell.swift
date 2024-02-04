//
//  TableViewCell.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupData(document: Document) {
        self.titleLabel.text = document.abstract
        self.sourceLabel.text = document.source
        
        
        guard let firstMultiMedia = document.multimedia.first else {
            //hanlde error
            return
        }
        guard let sourceUrl = firstMultiMedia.fullUrl else { return }
        self.customImageView.setImage(url: sourceUrl, placeholder: nil)
        
    }
}
