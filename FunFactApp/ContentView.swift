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
          Circle()
            .fill(Color("buttonColor"))
            .frame(width: !showFact ? geo.size.width - 100 : geo.size.width - 50)
            .overlay {
              if !showFact {
                Text("FUN FACT!")
                  .font(Font.custom("Futura", size: 50))
                  .minimumScaleFactor(0.5)
                  .foregroundStyle(Color("backgroundColor"))
              }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .offset(y: showFact ? (-geo.frame(in: .local).midY - safeAreaOffset) : 0)
            .onTapGesture {
              withAnimation(.smooth(duration: 0.5, extraBounce: 0.1)) {
                showFact.toggle()
              }
            }
        }
        .frame(maxHeight: .infinity)
      }
      .background(Color("backgroundColor"))
      
    }
}

#Preview {
    ContentView()
}
