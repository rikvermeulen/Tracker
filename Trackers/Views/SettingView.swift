//
//  SettingView.swift
//  Trackers
//
//  Created by Rik Vermeulen on 01/07/2021.
//

import Foundation
import SwiftUI

struct SettingView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            
            Form {
                Picker("Mode", selection: $isDarkMode) {
                    Text("Light")
                        .tag(false)
                    Text("Dark")
                        .tag(true)
                }.pickerStyle(SegmentedPickerStyle())
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark mode and use the current device theme")) {
                    
                    Toggle(isOn: .constant(true),
                           label: {
                            Text("Use system settings")
                            
                           })
            
                }
                
                Section {
                    Label("Follow me on twitter @OfficialRik", systemImage: "link")
                }
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
