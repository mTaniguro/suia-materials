//
//  TimerView.swift
//  HITFit
//
//  Created by mami taniguro on 8/18/21.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 30 
    @Binding var timerDone: Bool
    let timer = Timer.publish(
      every: 1,
      on: .main,
      in: .common)
      .autoconnect()

    var body: some View {
      Text("\(timeRemaining)")
        .font(.system(size: 90, design: .rounded))
        .padding()
        .onReceive(timer) { _ in
          if self.timeRemaining > 0 {
            self.timeRemaining -= 1
          } else {
            timerDone = true
          }
        }
    }
  }

  struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
      TimerView(timerDone: .constant(false))
        .previewLayout(.sizeThatFits)
    }
  }
