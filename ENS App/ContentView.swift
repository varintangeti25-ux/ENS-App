//
//  ContentView.swift
//  ENS App
//
//  Created by 64005899 on 4/7/26.
//

import SwiftUI

// MARK: - Destination Views

struct AdminView: View {
    var body: some View {
        Text("Admin Page")
            .navigationTitle("Admin")
    }
}

struct FamilyView: View {
    var body: some View {
        Text("Family Page")
            .navigationTitle("Family")
    }
}

// MARK: - Main Content View

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
        Color.white
        .ignoresSafeArea()
                
                // Logo / Header Image
        Image("ENS Image")
        .resizable()
        .scaledToFit()
        .frame(width: 379, height: 313)
        .offset(x: 0.50, y: -204.50)
                
                // Admin Login Button
        NavigationLink(destination: AdminView()) {
            ZStack {
        RoundedRectangle(cornerRadius: 296)
            .fill(Color(red: 1, green: 0.66, blue: 0.66))
            .frame(width: 186, height: 88)
            .shadow(color: Color.black.opacity(0.12), radius: 40, y: 8)
                        
        Text("Admin Login")
            .font(Font.custom("SF Pro", size: 17).weight(.bold))
            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
                    }
                }
                .offset(x: 0, y: 74)
                
                // Family Login Button
            NavigationLink(destination: FamilyView()) {
                ZStack {
                RoundedRectangle(cornerRadius: 296)
                .fill(Color(red: 1, green: 0.66, blue: 0.66))
                .frame(width: 186, height: 88)
                .shadow(color: Color.black.opacity(0.12), radius: 40, y: 8)
                        
        Text("Family Login")
                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
                    }
                }
                .offset(x: 0, y: 214)
                
                // Language Selector
    HStack(alignment: .top, spacing: 3) {
            Text("Language")
            .font(Font.custom("SF Pro", size: 16).weight(.bold))
            .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
            Image(systemName: "chevron.down")
            .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                }
                .offset(x: 107.50, y: 376)
            }
            .frame(width: 402, height: 874)
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
