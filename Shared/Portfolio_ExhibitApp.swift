//
//  Portfolio_ExhibitApp.swift
//  Shared
//
//  Created by Jason on 4/21/23.
//

import SwiftUI

@main
struct Portfolio_ExhibitApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        }
    }
}
