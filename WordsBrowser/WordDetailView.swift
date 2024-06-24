//
//  WordDetailView.swift
//  WordsBrowser
//
//  Created by Jungjin Park on 2024-06-24.
//

import SwiftUI

struct WordDetailView: View {
    @State var word: String
    @StateObject var viewModel = WordDetailViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isSearching {
                ProgressView("Fetching...")
            } else {
                List {
                    Section("Definitions") {
                        ForEach(viewModel.definitions) { definition in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("(\(definition.partOfSpeech)")
                                        .font(.caption)
                                    Text(definition.definition)
                                }
                                Spacer()
                            }
                        }
                    }
                    .lineLimit(2)
                }
            }
        }
        .navigationTitle(word)
    }
}

#Preview {
    NavigationStack {
        WordDetailView(word: "Swift")
    }
}
