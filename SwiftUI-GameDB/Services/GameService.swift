//
//  MovieService.swift
//  DependencyInjection
//
//  Created by Victor Hideo Oka on 02/11/19.
//  Copyright © 2019 Victor Hideo Oka. All rights reserved.
//

// The API that we will use to request latest games and game detail using IGDB wrapper.

import Foundation

protocol GameService {    
    func fetchPopularGames(for platform: Platform, completion: @escaping (Result<[Game], Error>) -> Void)
    func fetchGame(id: Int, completion: @escaping (Result<Game, Error>) -> Void)
}
