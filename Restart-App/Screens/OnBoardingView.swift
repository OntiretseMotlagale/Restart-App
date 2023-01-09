//
//  OnBoardingView.swift
//  Restart-App
//
//  Created by Ontiretse Motlagale on 2022/11/22.
//

import SwiftUI

struct OnBoardingView: View {
    
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    @State var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                Spacer()
                
                //MARK - HEADER
                VStack {
                    Text("Share.").font(.system(size: 60.0))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    
                    Text("""
                         It's not about how much we give but
                         but how much love we put into giving.
                         """).fontWeight(.light)
                        .foregroundColor(.white)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0: -40)
                .animation(.easeInOut(duration: 1), value: isAnimating)
             
                //: HEADER
                
                //MARK - CENTER
                ZStack {
                    RingGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: isAnimating ? 0: 50)
                        .animation(.easeOut(duration: 0.2), value: isAnimating)
                }
                
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding()
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started").font(.title3).fontWeight(.bold)
                        .offset(x: 20).foregroundColor(.white)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                        //MARK - Draggable Circle
                    }
                    
                    HStack {
                        
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                            
                            Capsule()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                                
                            Image(systemName: "chevron.right.2").font(.system(size: 26.0, weight: .bold))
                                .onTapGesture {
                                    playSound(sound: "chimeup", type: "mp3")
                                    isOnBoardingActive = false
                                }
    
                        }.foregroundColor(.white)
                            .frame(width: 80.0, height: 80.0, alignment: .center)
                        
                        Spacer()
                    }
                    
                }.frame(height: 80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1: 0)
                    .offset(y: isAnimating ? 0 : 50)
                    .animation(.easeInOut(duration: 0.5), value: isAnimating)
            
                //MARK - FOOTER
                
            }//MARK - VSTACK
        } //MARK - ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
        
  .preferredColorScheme(.dark)
     
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
