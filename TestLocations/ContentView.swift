//
//  ContentView.swift
//  TestLocations
//
//  Created by Josh Wright on 2/10/20.
//  Copyright © 2020 Josh Wright. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                LocationCollector.shared.start()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
