//
//  PostViewModel.swift
//  Paginify
//
//  Created by iMac on 02/05/24.
//

import Foundation

final class PostViewModel {
    
    var arrPost: [Post] = []
    var eventHandler: ((_ event: Event) -> Void)?
    var currentPage = 1
    var isLoading = false
    
    func fetchPosts() {
        
        guard currentPage <= 10 else { return }
        
        guard !isLoading else { return }
        isLoading = true
        
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [Post].self, type: EndPointItem.posts(page: currentPage)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let posts):
                self.arrPost.append(contentsOf: posts)
                self.currentPage += 1
                self.isLoading = false
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
}

extension PostViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
