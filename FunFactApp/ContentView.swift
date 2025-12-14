//
//  ContentView.swift
//  FunFactApp
//
//  Created by Cem Aksoy on 14.12.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var showFact = true
    var body: some View {
      GeometryReader { geo in
        let safeAreaOffset = geo.safeAreaInsets.top
        VStack {
          Circle()
            .fill(Color("buttonColor"))
            .frame(width: !showFact ? geo.size.width - 100 : geo.size.width - 50)
            .frame(maxWidth: .infinity, alignment: .center)
            .offset(y: showFact ? (-geo.frame(in: .local).minY - safeAreaOffset) : 0)
        }
      }
      .background(Color("backgroundColor"))
      
    }
}

#Preview {
    ContentView()
}
