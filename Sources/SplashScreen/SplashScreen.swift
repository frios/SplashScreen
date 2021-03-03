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
    
    let duration: Double
    let delay: Double
    let content: Content
    
    public init(duration: Double = 0, delay: Double = 0, @ViewBuilder contentProvider: () -> Content){
        self.duration = duration
        self.delay = delay
        self.content = contentProvider()
    }
    
    public var body: some View {
        content
            .edgesIgnoringSafeArea(.all)
            .opacity(showSplash ? 1 : 0)
            .zIndex(0) //push this screen to the back
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.easeOut(duration: duration)) {
                            showSplash = false
                    }
                }
            }
    }
}



