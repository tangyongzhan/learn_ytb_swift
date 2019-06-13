//
//  DynamicLists.swift
//  swiftUI_demo
//
//  Created by pm on 2019/6/9.
//  Copyright © 2019 pm. All rights reserved.
//

import SwiftUI

struct User:Identifiable {
    let id: Int
    let avatar: String
    let username, message: String
}


struct DynamicListContentView : View {
    
    let users: [User] = [
        .init(id: 0, avatar: "01", username: "Yongzhan", message: "iolations from this process for reading from preferences, or enabling CoreFoundation debug logging for more information. This will only be logged once."),
        .init(id: 1, avatar: "02", username: "TangTang", message: "current locale via 'AppleLocale' and 'AppleLanguages' in user preferences; falling back to locale identifier 'en_US' as the default.!!!!"),
        .init(id: 2, avatar: "03", username: "ZhanZhan", message: "swift ui  swift ui used")

    ]
    
    var body: some View {
        
        NavigationView {
            List{
                Text("Users").font(.largeTitle)
                ForEach(users.identified(by: \.id)){ user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic Lists").color(.black))
        }
    }
}


struct UserRow: View {
    let user: User
    var body: some View {
        HStack(alignment: .top){
            Image(user.avatar)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 3))
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 8){
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
                }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}



#if DEBUG
struct DynamicListContentView_Previews : PreviewProvider {
    static var previews: some View {
        DynamicListContentView()
    }
}
#endif
