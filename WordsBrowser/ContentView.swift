//
//  ContentView.swift
//  WordsBrowser
//
//  Created by Jungjin Park on 2024-06-24.
//

import SwiftUI

struct SectionView: View {
    var title: String
    var words: [String]
    
    init(_ title: String, words: [String]) {
        self.title = title
        self.words = words
    }
    
    var body: some View {
        Section(title) {
            if words.isEmpty {
                Text("(No items match your filter criteria)")
            } else {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}
struct ContentView: View {
    @StateObject var viewModel = LibraryViewModel()
    @State var isAddNewWordDialogPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                SectionView("Random word", words: [viewModel.randomWord])
                SectionView("Peter's Tips", words: viewModel.filteredTips)
                SectionView("My favorites", words: viewModel.filteredFavorites)
            }
            .searchable(text: $viewModel.searchText)
            .textInputAutocapitalization(.never)
            .navigationTitle("Library")
            .refreshable {
                await viewModel.refresh()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        isAddNewWordDialogPresented.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddNewWordDialogPresented) {
                NavigationStack {
                    AddWordView { word in
                        print(word)
                        viewModel.addFavorite(word)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
