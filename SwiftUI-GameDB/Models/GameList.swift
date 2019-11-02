//
//  GameList.swift
//  SwiftUI-GameDB
//
//  Created by Victor Oka on 02/11/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

// 1. @State: Storage of the property will be managed by SwiftUI. Whenever the value updates, the View will update the appearance inside the declaration of body. It’s the source of truth for the data inside a View.
// 2. @Binding: A binding property from a state, it can be used to pass value of a state to other View down in the hierarchy using the $ prefix operator. The View that gets the binding will be able to mutate the value and the View that has the state will be updated to reflect the changes in the data. Example, passing down the bind of boolean state to a Switch control that will be updated whenever the user toggles the switch on/off.
// 3. @ObservedObject: This is a property that represent the model in the View. The class needs to conform to ObservableObject protocol and invoke objectWillChange whenever the properties are updated. SwiftUI will observes the changes in the model and update the appearance inside the declaration of the body. In Xcode 11 Beta 5, we can declare the properties with @Published property wrapper for the object to magically publish the update to the View.
// 4. @EnvironmentObject: It acts just like the @ObservedObject , but in this case we can retrieve the object from the deepest child View up to the top ancestor/root View.

import Foundation

class GameList: ObservableObject {
    
    @Published var games: [Game] = []
    @Published var isLoading: Bool = false
    
    var gameService = GameStore.shared
    
    func reload(platform: Platform = .ps4) {
        self.games = []
        self.isLoading = true
        
        gameService.fetchPopularGames(for: platform) { [weak self] (result) in
            self?.isLoading = false
            
            switch result {
            case .success(let games):
                self?.games = games
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
