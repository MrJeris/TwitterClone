//
//  UserRowView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 30.03.2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        //Изображение аккаунта + никнейм + имя
        HStack(spacing: 12) {
            //Изображение аккаунта
            Circle()
                .frame(width: 48, height: 48)
            //Никнейм + имя
            VStack(alignment: .leading, spacing: 4) {
                //Никнейм
                Text("joker")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                //Имя
                Text("Heath Ledger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
