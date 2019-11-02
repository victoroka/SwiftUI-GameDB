//
//  GameListView.swift
//  SwiftUI-GameDB
//
//  Created by Victor Oka on 02/11/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var gameList: GameList = GameList()
    
    var body: some View {
        NavigationView {
            Group {
                if gameList.isLoading {
                    Text("Loading...")
                } else {
                    List(gameList.games) { game in
                        Text(game.name)
                    }
                }
            }
        }.onAppear {
            self.gameList.reload()
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
