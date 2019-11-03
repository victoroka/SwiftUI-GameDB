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
                    LoadingView()
                } else {
                    List(self.gameList.games) { game in
                        NavigationLink(destination: GameDetailView(gameId: game.id)) {
                            GameRowView(game: game)
                          }
                            .navigationBarTitle("PS4")
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
