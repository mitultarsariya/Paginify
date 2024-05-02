//
//  PostViewController.swift
//  Paginify
//
//  Created by iMac on 02/05/24.
//

import UIKit

class PostViewController: UIViewController {

    
    // MARK: - Outlets
    @IBOutlet weak var tblPostView: UITableView!
    
    // MARK: - Variables
    private var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
    


}

extension PostViewController {
    
    func configuration() {
        
        tblPostView.register(UINib(nibName: "tblPostCell", bundle: nil), forCellReuseIdentifier: "tblPostCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        
        viewModel.fetchPosts()
    }
    
    func observeEvent() {
    
        viewModel.eventHandler = { [weak self] event in
            
            guard let self = self else { return }
            switch event {
            case .loading:
                debugPrint("Post loading...")
            case .stopLoading:
                debugPrint("Stop loading...")
            case .dataLoaded:
                debugPrint("Data loaded")
                debugPrint(self.viewModel.arrPost)
                DispatchQueue.main.async {
                    self.tblPostView.reloadData()
                }
            case .error(let error):
                debugPrint(error as Any)
            }
        }
    }
    
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tblPostCell") as? tblPostCell else { return UITableViewCell() }
        let post = viewModel.arrPost[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        /// Load more posts when reaching the last cell
        if indexPath.row == viewModel.arrPost.count - 1 {
            viewModel.fetchPosts()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = viewModel.arrPost[indexPath.row]
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as! PostDetailViewController
        detailVC.selectedPost = post
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
