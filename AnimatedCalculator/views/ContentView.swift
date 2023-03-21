//
//  ContentView.swift
//  AnimatedCalculator
//
//  Created by Rajeev on 11/02/23.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.3), .purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
              KeyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
