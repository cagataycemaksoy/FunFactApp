//
//  ContentView.swift
//  FunFactApp
//
//  Created by Cem Aksoy on 14.12.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var showFact = false
  
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
          
          Image(systemName: showFact ? "chevron.down" : "chevron.up")
            .font(.title)
            .fontWeight(.medium)
            .foregroundStyle(Color("backgroundColor"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom)
        }
        .frame(width: !showFact ? geo.size.width / 1.9: geo.size.width - 50, height: !showFact ? geo.size.width / 1.9: geo.size.width - 50)
        .offset(y: showFact ? (-geo.frame(in: .local).midY - safeAreaOffset) : 0)
        .onTapGesture {
          withAnimation(.smooth(duration: 0.5, extraBounce: 0.1)) {
            showFact.toggle()
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .background(Color("backgroundColor"))
    
  }
}

#Preview {
    ContentView()
}
