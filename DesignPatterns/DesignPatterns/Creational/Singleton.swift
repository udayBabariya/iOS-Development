//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Uday on 31/01/24.
//

import Foundation


fileprivate class SettingsManager {
    
    // Singleton instance
    static let shared = SettingsManager()
    
    // Properties
    var theme: String = "Default"
    var notificationsEnabled: Bool = false
    
    
    // Private initializer to prevent creating multiple instances
    private init() {}
    
    // Additional methods
    func updateTheme(_ newTheme: String) {
        self.theme = newTheme
        print("Theme updated to: \(theme)")
    }
    
    func toggleNotifications() {
        notificationsEnabled.toggle()
        let status = notificationsEnabled ? "enabled" : "disabled"
        print("Notifications \(status)")
    }
}




//Usage of settingsManager

private func singletonUsage() {
    //Access the singleton instance
    let settings = SettingsManager.shared
    
    // Access and modify properties
    print("Current theme: \(settings.theme)")
    settings.updateTheme("Dark")
    
    // Toggle notifications
    print("Notifications are \(settings.notificationsEnabled ? "enabled" : "disabled")")
    settings.toggleNotifications()
    
}
