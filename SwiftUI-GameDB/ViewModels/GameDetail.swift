//
//  GameDetail.swift
//  SwiftUI-GameDB
//
//  Created by Victor Oka on 02/11/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

class GameDetail: ObservableObject {
    
    @Published var game: Game? = nil
    @Published var isLoading = false
    
    var gameService: GameService = GameStore.shared
    
    func reload(id: Int) {
        self.isLoading = true
        
        self.gameService.fetchGame(id: id) { [weak self] (result) in
            self?.isLoading = false
            
            switch result {
            case .success(let game):
                self?.game = game
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
