//
//  AppointFriendSearchView.swift
//  momogum
//
//  Created by nelime on 1/17/25.
//

import SwiftUI

struct AppointFriendSearchView: View {
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                Text("친구")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                VStack {
                    ForEach(0..<10) { _ in
                        AppointFriendListCellView()
                    }
                    
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always) ,prompt: "검색 바")
        }
//        .toolbarVisibility(.hidden)
    }
}

#Preview {
    AppointFriendSearchView()
}
