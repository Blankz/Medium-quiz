//
//  RepositoryTask.swift
//  Medium
//
//  Created by Blank on 28/4/2567 BE.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
