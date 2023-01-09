//
//  RingGroupView.swift
//  Restart-App
//
//  Created by Ontiretse Motlagale on 2022/11/23.
//

import SwiftUI

struct RingGroupView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40.0)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80.0)
                .frame(width: 260, height: 260, alignment: .center)
            
        }.blur(radius: isAnimating ? 0: 10)
            .scaleEffect(isAnimating ? 1 : 0.1)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeInOut(duration: 1), value: isAnimating)
            .onAppear(perform: {
                isAnimating = true
            })
    }
}

struct RingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            RingGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
