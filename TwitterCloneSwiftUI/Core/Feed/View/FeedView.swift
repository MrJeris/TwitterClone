//
//  FeedView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 28.03.2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                LazyVStack {
                    ForEach(0...20, id: \.self) { _ in
                        TweetRowView()
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
    }
}












struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
