//
//  ContentView.swift
//  swiftUI_demo
//
//  Created by pm on 2019/6/9.
//  Copyright © 2019 pm. All rights reserved.
//

import SwiftUI


struct People: Identifiable {
    var id: Int
    var name,imageName: String
    var isFavorite: Bool
}


struct FeatureCard: View {
    var people: People
    
    var body: some View {
        Image(people.imageName)
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .overlay(Text("12345"))
    }
}


struct ContentView : View {
    var peoples: [People] = [
        .init(id: 1, name: "tangtang", imageName: "01", isFavorite: false),
        .init(id: 2, name: "yongzhan", imageName: "02",isFavorite: false),
        .init(id: 3, name: "learn", imageName: "03",isFavorite: false),
        .init(id: 4, name: "learn", imageName: "04",isFavorite: true),
        .init(id: 5, name: "learn", imageName: "05",isFavorite: true),
        .init(id: 6, name: "learn", imageName: "06",isFavorite: true),
    ]
    
    
    
    var body: some View {
        VStack{
            FeatureCard(people: .init(id: 1, name: "tangtang", imageName: "01", isFavorite: false))
            List(peoples) { landmark in
                
                HStack {
                    Image(landmark.imageName)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40, alignment: .center)
                    Text(landmark.name)
                    Spacer()
                    
                    if landmark.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
