//
//  SplashScreen.swift
//  mFood
//
//  Created by Ferdinand Rios on 4/13/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//


import SwiftUI

public struct SplashScreen: View {
    
    @State private var showSplash = true

    let uLineWidth: CGFloat = 5
    let uZoomFactor: CGFloat = 1.4
    
    @State var percent = 0.0
    @State var uScale: CGFloat = 1
    
    public init(){}
    
    public var body: some View {
        ZStack {
            Text("mFood Vendor")
                .font(.largeTitle)
//                .foregroundColor(.mFoodColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .opacity(showSplash ? 1 : 0)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.linear(duration: 1)) {
                        self.showSplash = false
                }
            }
        }
        .zIndex(0)

    }
}

extension SplashScreen {
    var uAnimationDuration: Double { return 1.0 }
    
    func handleAnimations() {
        runAnimationPart1()
        restartAnimation()
    }
    
    func runAnimationPart1() {
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            percent = 1
            uScale = 5
        }
    }
    
    func restartAnimation() {
        let deadline: DispatchTime = .now() + uAnimationDuration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.percent = 0
            self.handleAnimations()
        }
    }
}



struct SplashScreen_Previews : PreviewProvider {
    static var previews: some View {
        SplashScreen().previewLayout(.sizeThatFits)
    }
}

