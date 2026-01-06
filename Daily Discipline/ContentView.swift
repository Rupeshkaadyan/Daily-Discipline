//
//  ContentView.swift
//  Daily Discipline
//
//  Created by Ethan on 02/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var habits = [
        "Study iOS",
        "Workout",
        "Dink Water",
        "Sleep on Time"
    ]
    
    @State private var completed = [
        false,
        false,
        false,
        false
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Daily Discipline")
                .font(.largeTitle)
                .bold()
            
            Text("\(completed.filter { $0 }.count) / \(completed.count) completed")
                .font(.title2)
            
            VStack(spacing: 12) {
                ForEach(habits.indices, id: \.self) { index in
                    Button {
                        completed[index].toggle()
                    } label: {
                        HStack {
                            Text(habits[index])
                                .font(.title3)
                                .strikethrough(completed[index])
                                .opacity(completed[index] ? 0.5 : 1)
                            
                            Spacer()
                            
                            Image(systemName: completed[index] ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(completed[index] ? .green : .gray)
                        }
                    }
                }
            }
            Button("Reset Day") {
                for i in completed.indices {
                    completed[i] = false
                }
               
                    
            }
            .padding(.top, 20)
            .foregroundColor(.red)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
