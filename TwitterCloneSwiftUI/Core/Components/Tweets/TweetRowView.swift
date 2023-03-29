//
//  TweetRowView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 29.03.2023.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //Фотография пользователя + информация о пользователе + текст твита
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                //Информация о пользователе и текст твита
                VStack(alignment: .leading, spacing: 4) {
                    //Информация о пользователе
                    HStack {
                        //Имя пользователя
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        //Никнейм пользователя
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        //Когда был написан
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //Текст твита
                    Text("I believe in Harvey Deat")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            //Активные кнопки (Комментарий, Репост, Лайк, Избранное)
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
