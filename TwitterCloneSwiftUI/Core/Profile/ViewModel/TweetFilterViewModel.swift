//
//  TweetFilterViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 30.03.2023.
//

import Foundation

//enum (Перечисление) | CaseIterable - необходимо для получение коллекции всех кейсов перечисления
enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
