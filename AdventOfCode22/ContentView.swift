//
//  ContentView.swift
//  AdventOfCode22
//
//  Created by Jalp Desai on 01/12/2022.
//

import SwiftUI

final class Helper {
    func getData(from file: String) -> String {
        guard let path = Bundle.main.path(forResource: file, ofType: "txt") else { return "" }
        guard let data = try? String(contentsOfFile: path, encoding: .utf8) else { return "" }
        return data
    }
}


class DaySolutions {
    let helper = Helper()
    
    func day1() {
        let input = helper.getData(from: "Day1")
        var tempBois: [Int] = []
        var counter = 0
        
        let calories = input.components(separatedBy: .whitespacesAndNewlines).compactMap { Int($0) ?? 0 }
        
        for calorie in calories {
            if !(calorie == 0) {
                counter += calorie
            } else {
                tempBois.append(counter)
                counter = 0
            }
        }
        print("Solution 1 -> \(tempBois.max())")
        print("Solution 2 -> \(tempBois.sorted().suffix(3).reduce(0, +))")
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear() {
            DaySolutions().day1()
        }
    }
}
