//
//  WordDetailViewModel.swift
//  WordsBrowser
//
//  Created by Jungjin Park on 2024-06-24.
//

import Foundation
import Combine

class WordDetailViewModel: ObservableObject {
    @Published private var result = Word.empty
    @Published var isSearching = false
    @Published var definitions = [Definition]()
}
