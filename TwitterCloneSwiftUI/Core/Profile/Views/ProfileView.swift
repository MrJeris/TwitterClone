//
//  ProfileView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 30.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets   
    @Environment(\.dismiss) private var mode
    @Namespace private var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionsButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}



//Extension (расширение) структуры ProfileViewб (более удобно читать код)
extension ProfileView {
    
    //Синий фон + кнопка назад + фотография пользователя (аккаунта)
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            //Задний фон
            Color(.systemBlue)
                .ignoresSafeArea()  //Закрашивает пространство челки
            
            //Кнопка назад + фотография пользователя
            VStack {
                //Кнопка назад
                Button {
                    mode()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }
                .offset(x: 16, y: 12)
                
                //Фотография пользователя
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    //Активные кнопки (уведомления и редактирование профиля)
    var actionsButtons: some View {
        HStack (spacing: 12) {
            Spacer()
            
            //Уведомления в круге
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(.gray, lineWidth: 0.75))
            
            //Кнопка редактирование профиля
            Button {
                //Действие
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    //Информация о пользователе (Имя, Галочка, Никнейм, Описание, Расположение, Ссыла на сайт, Количество подписок, Количество подписчиков)
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            //Имя пользователя + Галочка
            HStack {
                //Имя
                Text("Heath Ledger")
                    .font(.title2).bold()
                //Галочка
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            //Никнейм
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            //Описание
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            //Местоположение + Ссылка на сайт
            HStack (spacing: 24) {
                //Местоположение
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                //Ссылка на сайт
                HStack {
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
                
            //Количество подписок и подписчиков
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)  //Если элемент выбран то применяем semibold иначе regular
                        .foregroundColor(selectedFilter == item ? .black : .gray)   //Если элемент выбран то применяем черный цвет иначе серый цвет
                    
                    //Подчёркивание выбранного элемента
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    //Анимация смены выбранного элемента
                    withAnimation(.easeOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    
    var tweetView: some View {
        //Скролл всех твитов
        ScrollView {
            LazyVStack {
                ForEach(0...9, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
