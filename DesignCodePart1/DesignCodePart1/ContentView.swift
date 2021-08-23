//
//  ContentView.swift
//  DesignCodePart1
//
//  Created by Jinho Choi on 2021/08/16.
//

import SwiftUI

/*
    SwiftUI는 선언적 언어
    - 따라서 화면에 올리는데로 그려짐
    - ZStack의 경우 같은 사이즈의 이미지를 올린다면? 먼저 그린 친구부터 아래에 깔리게 됨 (순서를 주의하지 않으면 원하는 뷰를 그릴수 없음)
 */

struct ContentView: View {

    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false

    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    //Animation()이 생략되어 있음
                        .default
                        .delay(0.1)
//                        .speed(2)
//                        .repeatCount(3, autoreverses: false)
                )

            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.90)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 :10), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.5))

            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))

            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )

            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            // padding default = 16
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {

    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()
            }
            .padding()

            Image("Background1")

            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .opacity(0.1)

            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)

            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
