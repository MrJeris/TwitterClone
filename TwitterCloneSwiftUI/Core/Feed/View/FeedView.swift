//
//  FeedView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 28.03.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...20, id: \.self) { _ in
                    TweetRowView()
                }
            }
        }
    }
}












struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
