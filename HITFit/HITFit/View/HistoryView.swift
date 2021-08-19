//
//  HistoryView.swift
//  HITFit
//
//  Created by mami taniguro on 8/16/21.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // swiftlint:disable:next multiple_closures_with_trailing_closure
            Button(action: {showHistory.toggle()}) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
            
            VStack {
                Text(
                    NSLocalizedString(
                        "History", comment: "view user activity"
                    )
                )
                .font(.title)
                .padding()
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(
                            header:
                                Text(day.date.formatted(as: "MMMM d"))
                                .font(.headline)) {
                            
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
