//
//  LibraryViewModel.swift
//  WordsBrowser
//
//  Created by Jungjin Park on 2024-06-24.
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var randomWord = "partially"
    @Published var tips: [String] = ["Swift", "authentication", "authorization"]
    @Published var favorites: [String] = ["stunning", "brilliant", "marvelous"]
    
    @Published var filteredTips = [String]()
    @Published var filteredFavorites = [String]()
}
