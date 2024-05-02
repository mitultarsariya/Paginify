//
//  PostDetailViewController.swift
//  Paginify
//
//  Created by iMac on 02/05/24.
//

import UIKit

class PostDetailViewController: UIViewController {

    
    
    // MARK: - Outlets
    @IBOutlet weak var lblDetailTitle: UILabel!
    @IBOutlet weak var lblDetailBody: UILabel!
    @IBOutlet weak var postBackgroundView: UIView!
    
    
    // MARK: - Variables
    var selectedPost: Post? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
    
    
    

    
    

}

extension PostDetailViewController {
    
    func configuration() {
        
        self.lblDetailTitle.text = "\(selectedPost?.id ?? 0). \(selectedPost?.title ?? "")"
        self.lblDetailBody.text = selectedPost?.body
        
        postBackgroundView.layer.cornerRadius = 15
        postBackgroundView.backgroundColor = .systemGray6
    }
    
}
