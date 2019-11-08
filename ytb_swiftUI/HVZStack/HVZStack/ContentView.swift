//
//  ContentView.swift
//  HVZStack
//
//  Created by pm on 2019/11/8.
//  Copyright © 2019 pm. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
//        VStack{
//            Spacer()
//            Text("Hello").font(.system(size: 24))
//                .padding(.horizontal, 12)
//                .padding(.vertical, 8)
//                .background(Color.red)
//        }.background(Color.blue)
        
//        HStack{
//            Text("Word").font(.system(size: 24))
//            .padding(.horizontal, 12)
//            .padding(.vertical, 8)
//            .background(Color.red)
//            Spacer()
//        }.background(Color.blue)
        
        
//        VStack {
//            HStack{
//                Text("Word").font(.system(size: 24))
//                .padding(.horizontal, 12)
//                .padding(.vertical, 8)
//                .background(Color.red)
//                Spacer().frame(height: 10)
//                    .background(Color.green)
//            }.background(Color.blue)
//            Spacer().frame(width: 10)
//                .background(Color.green)
//            HStack{
//                Spacer().frame(height: 10)
//                    .background(Color.green)
//                Text("Word").font(.system(size: 24))
//                    .padding(.horizontal, 12)
//                    .padding(.vertical, 8)
//                    .background(Color.red)
//            }.background(Color.blue)
//        }.background(Color.yellow)
        
        
//        ZStack {
//            Color.green
//        }
        
//        ZStack {
//            Color.green.edgesIgnoringSafeArea(.all)
//        }
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            FrontView()
        }
        
    }
}

struct FrontView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Word").font(.system(size: 24))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.red)
                Spacer().frame(height: 10)
                    .background(Color.green)
            }.background(Color.blue)
            Spacer().frame(width: 10)
                .background(Color.green)
            HStack{
                Spacer().frame(height: 10)
                    .background(Color.green)
                Text("Word").font(.system(size: 24))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.red)
            }.background(Color.blue)
        }.background(Color.yellow)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
