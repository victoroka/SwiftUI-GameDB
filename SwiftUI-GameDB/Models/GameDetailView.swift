//
//  GameDetailView.swift
//  SwiftUI-GameDB
//
//  Created by Victor Oka on 02/11/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct GameDetailView: View {
    
    var gameId: Int
    var body: some View {
        Text(String(gameId))
    }
}
