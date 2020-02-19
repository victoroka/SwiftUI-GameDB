//
//  GameDetailView.swift
//  SwiftUI-GameDB
//
//  Created by Victor Oka on 02/11/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

// MARK: Main Game Detail View
struct GameDetailView: View {
    
    @ObservedObject var gameDetail: GameDetail = GameDetail()
    @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    
    var gameId: Int
    
    var body: some View {
        Group {
            if self.gameDetail.game != nil {
                List {
                    PosterView(image: self.imageLoader.image)
                        .onAppear {
                            if let url = self.gameDetail.game?.coverURL {
                                self.imageLoader.downloadImage(url: url)
                            }
                        }
                    GameSectionView(game: self.gameDetail.game!)
                }
            } else {
                LoadingView()
            }
        }
        .edgesIgnoringSafeArea([.top])
        .onAppear {
            self.gameDetail.reload(id: self.gameId)
        }
    }
}

// MARK: Poster View
struct PosterView: View {
    
    var image: UIImage?
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .aspectRatio(500/750, contentMode: .fit)
            
            if image != nil {
                Image(uiImage: self.image!)
                    .resizable()
                    .aspectRatio(500/750, contentMode: .fit)
            }
        }
    }
}

// MARK: Game Section View
struct GameSectionView: View {
    
    var game: Game
    
    var body: some View {
        Section {
            Text(game.summary)
                .font(.body)
                .lineLimit(nil)
            
            if !game.storyline.isEmpty {
                Text(game.storyline)
                    .font(.body)
                    .lineLimit(nil)
            }
            
            Text(game.genreText)
                .font(.subheadline)
            Text(game.releaseDateText)
                .font(.subheadline)
            Text(game.company)
                .font(.subheadline)
        }
    }
}
