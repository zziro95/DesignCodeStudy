//
//  Home.swift
//  DesignCodePart1
//
//  Created by 최진호 on 2021/09/02.
//

import SwiftUI

struct Home: View {

    @State var showProfile: Bool = false

    var body: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea(.all)

            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))

                    Spacer()

                    Button(action: { self.showProfile.toggle() }, label: {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })

                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })
                }
                .padding(.horizontal)
                .padding(.top, 30)

                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
            .scaleEffect(showProfile ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
            .offset(y: showProfile ? -450 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .ignoresSafeArea(.all)

            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
