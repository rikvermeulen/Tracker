//
//  TrackersApp.swift
//  Trackers
//
//  Created by Rik Vermeulen on 01/07/2021.
//

import SwiftUI
import MapKit


@main
struct TrackersApp: App {
    @StateObject var locations = Locations()
    @ObservedObject private var locationManager = LocationManager()
    @StateObject var monitor = Monitor()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        
        WindowGroup {
            Text(monitor.status.rawValue)
            
            TabView {

                NavigationView {
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }

                NavigationView {
                   
                    WorldView()
                }

                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Locations")
                }


                NavigationView {
                    TipsView()
                }

                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tips")
                }
                
                NavigationView {
                    SettingView()
                }

                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }

            }
            .environmentObject(locations)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
