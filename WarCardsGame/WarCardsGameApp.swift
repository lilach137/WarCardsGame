//
//  WarCardsGameApp.swift
//  WarCardsGame
//
//  Created by Student19 on 24/06/2023.
//

import SwiftUI

@main
struct WarCardsGameApp: App {
    @StateObject var locationManager = LocationManager()
     var body: some Scene {
         WindowGroup {
             PrimaryView().environmentObject(locationManager)
         }
     }}
