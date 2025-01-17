//
//  ContentView.swift
//  HITFit
//
//  Created by mami taniguro on 7/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            WelcomeView(selectedTab: $selectedTab)
              .tag(9)
            
            ForEach(0 ..< Exercise.exercises.count) { index in
              ExerciseView(selectedTab: $selectedTab, index: index)
                .tag(index)
            }
        }
        .environmentObject(HistoryStore())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
