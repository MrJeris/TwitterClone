//
//  UserStatsView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 31.03.2023.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack (spacing: 24) {
            //Количество подписок
            HStack(spacing: 4) {
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            //Количество подписчиков
            HStack(spacing: 4) {
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
