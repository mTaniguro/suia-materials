//
//  WelcomeView.swift
//  HITFit
//
//  Created by mami taniguro on 7/29/21.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int
   
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab,
                    titleText: NSLocalizedString(
                        "Welcome", comment: "greeting"))
                Spacer()
                Button(NSLocalizedString("History", comment: "view user activity")) {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("Get Fit", comment: "invitation to exercise"))
                        .font(.largeTitle)
                    Text("with high intensity interval training")
                        .font(.headline)
                }
                Image("step-up")
                    .resizedToFill(width: 240, height: 240)
                    .clipShape(Circle()) // make the image shape cricle
            }
            Button(action: {selectedTab = 0 }) {
              Text(
                NSLocalizedString(
                  "Get Started", comment: "invitation")
              )
              Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(
                // give this button a border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
            )
           
        }
       }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
