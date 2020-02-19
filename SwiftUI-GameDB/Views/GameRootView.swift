//
//  GameRootView.swift
//  SwiftUI-GameDB
//
//  Created by Victor Oka on 03/11/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct GameRootView: View {
    
    var body: some View {
        TabView {
            ForEach(Platform.allCases, id: \.self) { p in
                GameListView(platform: p).tag(p)
                    .tabItem {
                        Image(p.assetName)
                        Text(p.description)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
