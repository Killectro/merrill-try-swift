//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

URLSession.shared.dataTask(with: URL(string: "http://tryswiftmerrill.herokuapp.com/json/puzzle.json")!) { (data, _, _) in
    guard let json = data.flatMap({ try? JSONSerialization.jsonObject(with: $0, options: .allowFragments) }) as? [String] else {
        return
        print("💀⚰️💀")
    }

    let deciphered = json
        .filter { !$0.hasPrefix("_") }
        .map { String($0.reversed()) }
        .joined(separator: " ")

    print(deciphered)
}.resume()
