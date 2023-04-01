//
//  SideMenuView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 31.03.2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            //Фото + имя + никнейм + подписки + подписчики
            VStack(alignment: .leading) {
                //Фото профиля
                Circle()
                    .frame(width: 48, height: 48)
                
                //Имя + никнейм
                VStack(alignment: .leading, spacing: 4) {
                    //Имя
                    Text("Bruce Wayne")
                        .font(.headline)
                    
                    //Никнейм
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                //Количество подписок и подписчиков
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            //Иконки меню (Профиль + Список + Закладки + Выход из аккаунта)
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        print("Handle logout here...")
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
            }
            
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
