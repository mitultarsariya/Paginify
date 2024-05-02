//
//  tblPostCell.swift
//  Paginify
//
//  Created by iMac on 02/05/24.
//

import UIKit

class tblPostCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    var post: Post? {
        didSet {
            postConfiguration()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func postConfiguration() {
        guard let post else { return }
        lblID.text = "\(post.id)."
        lblTitle.text = post.title
    }
    
}
