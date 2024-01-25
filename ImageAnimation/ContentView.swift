//
//  ContentView.swift
//  ImageAnimation
//
//  Created by Vladimir Vinakheras on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var girl = false
    @State private var leftLeg = false
    @State private var rightLeg = false
    let fadeOutRope  = Gradient(colors: [.clear, .black])
    var body: some View {
        
        ZStack {
          Image("tree")
                .resizable()
                .frame(width: 550,height: 900)
            ZStack{
                //Right leg
                Image("leg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(rightLeg ? -20 : 50), anchor: .topTrailing)
                    .scaleEffect(0.12)
                    .offset(x: -448, y: 92)
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.1).repeatForever(autoreverses: true), value: rightLeg)
                    .onAppear(){
                        rightLeg.toggle()
                    }
                
                Image("girl").resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(0.25)
                    .offset(x: -300, y: 0)
                
                //Left leg
                Image("leg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(rightLeg ? -30 : 30), anchor: .topTrailing)
                    .scaleEffect(0.12)
                    .offset(x: -455, y: 90)
                    .animation(Animation.easeInOut(duration: 0.7).delay(0.09).repeatForever(autoreverses: true), value: rightLeg)
                    .onAppear(){
                        leftLeg.toggle()
                    }
                //right side rope
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeOutRope, startPoint: .top, endPoint: .bottom))
                    .frame(width: 57, height: 80)
                    .offset(x: -189, y: -100)
               //left side rope
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeOutRope, startPoint: .top, endPoint: .bottom))
                    .frame(width: 57, height: 80)
                    .offset(x: -228, y: -108)
            }
            .offset(x: 20, y: 20)
            .rotationEffect(.degrees(girl ? -25 : -40), anchor: .top)
            .animation(Animation.easeInOut(duration: 0.9).delay(0.04).repeatForever(autoreverses: true), value:  girl)
            .onAppear(){
                girl.toggle()
            }
            .frame(width: 950, height: 900)
            
            Image("leaves").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 460, height: 400)
                .rotationEffect(.degrees(-10), anchor: .trailing)
                .offset(x: -60, y: -160)
        }
    }
}

#Preview {
    ContentView()
}
