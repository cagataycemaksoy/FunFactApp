//
//  ContentView.swift
//  FunFactApp
//
//  Created by Cem Aksoy on 14.12.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var showFact = false
  @State private var offsetFactor = 0.0
  @State private var opacityFactor = 0.0
  @Namespace private var animation
  
  var body: some View {
    GeometryReader { geo in
      let safeAreaOffset = geo.safeAreaInsets.top
      VStack {
        ZStack {
          Circle()
            .fill(Color("buttonColor"))
          
          if !showFact {
            Text("FUN FACT!")
              .font(Font.custom("Futura", size: 35))
              .minimumScaleFactor(0.5)
              .multilineTextAlignment(.center)
              .foregroundStyle(Color("backgroundColor"))
          }
          
          if showFact {
            chevronImage("down")
          } else {
            chevronImage("up")
              .opacity(1 - opacityFactor)
              .offset(y: offsetFactor)
          }
        }
        .frame(width: !showFact ? geo.size.width / 1.9: geo.size.width - 50, height: !showFact ? geo.size.width / 1.9: geo.size.width - 50)
        .offset(y: showFact ? (-geo.frame(in: .local).midY - safeAreaOffset) : 0)
        .onTapGesture {
          
          withAnimation(.smooth(duration: 0.65, extraBounce: 0.1)) {
            showFact.toggle()
          }
          
          withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: false)) {
            offsetFactor = showFact ? 0.0 : -19.0
            opacityFactor = showFact ? 0.0 : 1.0
          }
          
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .onAppear {
        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: false)) {
          offsetFactor =  -19.0
          opacityFactor = 1.0
        }
      }
    }
    .background(Color("backgroundColor").gradient)
  }
  
  @ViewBuilder
  func chevronImage(_ type: String) -> some View {
    Image(systemName: "chevron.\(type)")
      .font(.title)
      .fontWeight(.medium)
      .foregroundStyle(Color("backgroundColor"))
      .matchedGeometryEffect(id: "image", in: animation)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
      .padding(.bottom)
  }
}

#Preview {
    ContentView()
}
