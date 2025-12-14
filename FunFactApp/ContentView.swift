//
//  ContentView.swift
//  FunFactApp
//
//  Created by Cem Aksoy on 14.12.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      GeometryReader { geo in
        Circle()
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      }
    }
}

#Preview {
    ContentView()
}
