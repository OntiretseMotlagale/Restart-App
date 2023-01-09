//
//  HomeView.swift
//  Restart-App
//
//  Created by Ontiretse Motlagale on 2022/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingView = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        VStack (spacing :20) {
            Spacer()
            
            //MARK - 1. HEADER
            ZStack {
                RingGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever(),
                    value: isAnimating
                        )
            }
        
            
            //MARK - 2. CENTER
          
            Text("The time that leads to mastery is dependant on the intensity of our focus.").multilineTextAlignment(.center)
                .font(.title3)
                .padding()
                .fontWeight(.light)
                .foregroundColor(.secondary)
            
            Spacer()
            
            //MARK - 3. FOOTER
            
            Button(action: {
                playSound(sound: "success", type: "m4a")
                isOnboardingView = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .font(.title3)
                
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            
            
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                isAnimating = true
            })
        })
    }
        }
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
