//
//  SplashScreen.swift
//  mFood
//
//  Created by Ferdinand Rios on 4/13/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//


import SwiftUI

public struct SplashScreen<Content: View>: View {
    
    @State private var showSplash = true

    @State var percent = 0.0
    @State var uScale: CGFloat = 1
    
    let content: Content
    
    public init(@ViewBuilder contentProvider: () -> Content){
        self.content = contentProvider()
    }
    
    public var body: some View {
        ZStack {
            content
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



