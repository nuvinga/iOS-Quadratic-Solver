//
//  ContentView.swift
//  QuadraticSolver
//  Starter project code
//  Created by Philip Trwoga on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("aString") private var aString: String = "1.0"
    @AppStorage("bString") private var bString: String = "6.0"
    @AppStorage("cString") private var cString: String = "1.0"
    @AppStorage("x1") private var x1: Double = 0.0
    @AppStorage("x2") private var x2: Double = 0.0
    
    var body: some View {
        VStack {
            Text("Quadratic Solver")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
        
            .padding()
            Text("This quadratic form is:")
                .font(.body)
            Image("quadraticForm").resizable().scaledToFit()
            
            VStack {
                Label("Enter the First Term", systemImage: "a.circle.fill")
                TextField("0.0", text: $aString)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack {
                Label("Enter the Second Term", systemImage: "b.circle.fill")
                TextField("0.0", text: $bString)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            VStack {
                Label("Enter the Third Term", systemImage: "c.circle.fill")
                TextField("0.0", text: $cString)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button {
                Task {
                    guard let a = Double(self.aString), let b = Double(self.bString), let c = Double(self.cString)
                    else {
                        return
                    }
                    
                    x1 = solveForX(a: a, b: b, c: c, plus: true)
                    x2 = solveForX(a: a, b: b, c: c, plus: false)
                }
            } label: {
                Text("Solve for X")
            }
            .padding(.vertical)
            
            Text("x1 = \(x1), x2 = \(x2)")
            
        }
        .padding(.horizontal)
    }
    
    func solveForX (a: Double, b: Double, c: Double, plus: Bool) -> Double {
        var x = 0.0
        let discriminant = b * b - 4 * a * c
        
        if discriminant > 0 {
            x = plus ? (-b + sqrt(discriminant)) / (2 * a) : (-b - sqrt(discriminant)) / (2 * a)
        }
        return x
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
