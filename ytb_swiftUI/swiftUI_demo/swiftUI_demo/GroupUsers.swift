//
//  GroupUsers.swift
//  swiftUI_demo
//
//  Created by pm on 2019/6/9.
//  Copyright © 2019 pm. All rights reserved.
//

import SwiftUI


// 数据
struct Post: Identifiable{
    let id: Int
    let name, message, imagesName: String
}


struct GroupUsersContentView: View {
    
    
    let posts: [Post] = [
        .init(id: 1, name: "Some people", message: "violations from this process for reading from preferences, or enabling CoreFoundation deb", imagesName: "01"),
        .init(id: 2, name: "Tim cooke", message: "debug logging for more information. This will only be logged once.", imagesName: "02"),
        .init(id: 3, name: "Xu zhiqian", message: "Post1 content", imagesName: "03"),
        .init(id: 4, name: "Tang yongzhan", message: "current locale via 'AppleLocale' and 'AppleLanguages' in user preferences;", imagesName: "04"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Trending")
                    ScrollView {
                        HStack(alignment: .center, spacing: 16){
                            ForEach(posts.identified(by: \.id)){ post in
                                NavigationButton(destination: GroupDetailView()) {
                                     GroupView(post: post)
                                }
                            }
                        }.padding(.leading, 0)
                    }.frame(height: 180)
                }
                
                ForEach(posts.identified(by: \.id)){ post in
                    PostView(post: post)
                }
            }.padding(.leading, -16).padding(.trailing,-16).navigationBarTitle(Text("Group Users"))
        }
        
    }
}

// 用户
struct GroupView: View {
    var post: Post
    var body: some View {
        VStack {
            Image(post.imagesName)
            .renderingMode(.original)
            .resizable()
            .frame(width: 120, height: 140).cornerRadius(4).clipped()
            Text(post.name).color(.primary).font(.headline)
        }.frame(width: 120, height: 180).padding(.leading, 0)
    }
}


// 详情
struct GroupDetailView: View {
    var body: some View {
        Text("GroupDetailView")
    }
}


// 帖子
struct PostView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack(){
                Image(post.imagesName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50).clipped()
                VStack(alignment: .leading, spacing: 0) {
                     Text(post.name).font(.headline)
                     Text("Posted 8 hrs ago").font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 20)
            Text(post.message).font(.subheadline).lineLimit(nil).padding(.leading, 16).padding(.trailing, 16)
            Image(post.imagesName)
                .resizable()
                .frame(height: 300, alignment: .center)
                .clipped()
            }.padding(.bottom, -8)
    }
}


#if DEBUG
struct GroupUsersContentView_Previews : PreviewProvider {
    static var previews: some View {
        GroupUsersContentView()
    }
}
#endif
