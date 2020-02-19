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
    var platform: Platform = .ps4
    
    var body: some View {
        NavigationView {
            Group {
                if gameList.isLoading {
                    LoadingView()
                } else {
                    List(self.gameList.games) { game in
                        NavigationLink(destination: GameDetailView(gameId: game.id)) {
                            GameRowView(game: game)
                        }
                    }
                }
            }
            .navigationBarTitle(self.platform.description)
        }
        .onAppear {
            if self.gameList.games.isEmpty {
                self.gameList.reload(platform: self.platform)
            }
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
