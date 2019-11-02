//
//  MovieService.swift
//  DependencyInjection
//
//  Created by Victor Hideo Oka on 02/11/19.
//  Copyright © 2019 Victor Hideo Oka. All rights reserved.
//

import Foundation

protocol GameService {    
    func fetchPopularGames(for platform: Platform, completion: @escaping (Result<[Game], Error>) -> Void)
    func fetchGame(id: Int, completion: @escaping (Result<Game, Error>) -> Void)
}
