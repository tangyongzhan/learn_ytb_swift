//
//  ContentView.swift
//  ytb_swiftUI_state
//
//  Created by pm on 2019/6/13.
//  Copyright © 2019 pm. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var users = [String]()
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: nil) {
                VStack(alignment: .leading, spacing: nil) {
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            TextField($firstName, placeholder: Text("input firstname")).padding(.all, 10)
                        }.background(Color.white)
                            .cornerRadius(5).clipped().shadow(radius: 5)
                        Group {
                            TextField($lastName, placeholder: Text("input lastName")).padding(.all, 10)
                            }.background(Color.white)
                                .cornerRadius(5).clipped().shadow(radius: 5)
                        
                        Button(action: {
                            if self.firstName.count + self.lastName.count > 0 {
                                self.users.append(self.firstName + self.lastName)
                                self.firstName = ""
                                self.lastName = ""
                            }
                        }) {
                            Group{
                                Text("Add newUser").color(.white).padding(.all, 12)
                                }.background(firstName.count + lastName.count > 0 ? Color.red : Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 5)).shadow(radius: 5)
                        }
    
                        }.padding(.all,10)

                }.background(Color.gray)
                
                List(users.identified(by: \.self)){
                    Text($0)
                }
                
            }.navigationBarTitle(Text("Add User"))
                .navigationBarItems(leading: HStack(alignment: .firstTextBaseline, spacing: nil, content: {
                    Text("first name:")
                    Text(firstName).color(.red)
                    Text("last name:")
                    Text(lastName).color(.red)
                }))
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
