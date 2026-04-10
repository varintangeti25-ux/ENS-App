//
//  ContentView.swift
//  ENS App
//
//  Created by 64005899 on 4/7/26.
//

import SwiftUI

// MARK: - Language Manager

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String = "English"
    
    let translations: [String: [String: String]] = [
        "English": [
            "adminLogin": "Admin Login",
            "familyLogin": "Family Login",
            "language": "Language",
            "adminPage": "Admin Page",
            "familyPage": "Family Page"
        ],
        "Spanish": [
            "adminLogin": "Inicio Admin",
            "familyLogin": "Inicio Familia",
            "language": "Idioma",
            "adminPage": "Página de Admin",
            "familyPage": "Página de Familia"
        ],
        "Somali": [
            "adminLogin": "Galitaanka Admin",
            "familyLogin": "Galitaanka Qoyska",
            "language": "Luqadda",
            "adminPage": "Bogga Admin",
            "familyPage": "Bogga Qoyska"
        ]
    ]
    
    func text(_ key: String) -> String {
        return translations[currentLanguage]?[key] ?? key
    }
}

// MARK: - Destination Views

struct AdminView: View {
    @ObservedObject var languageManager: LanguageManager
    
    var body: some View {
        Text(languageManager.text("adminPage"))
            .navigationTitle(languageManager.text("adminLogin"))
    }
}

struct FamilyView: View {
    @ObservedObject var languageManager: LanguageManager
    
    var body: some View {
        Text(languageManager.text("familyPage"))
            .navigationTitle(languageManager.text("familyLogin"))
    }
}

// MARK: - Main Content View

struct ContentView: View {
    @StateObject var languageManager = LanguageManager()
    @State private var showLanguagePicker = false
    
    let languages = ["English", "Spanish", "Somali"]
    
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
                NavigationLink(destination: AdminView(languageManager: languageManager)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 296)
                            .fill(Color(red: 1, green: 0.66, blue: 0.66))
                            .frame(width: 186, height: 88)
                            .shadow(color: Color.black.opacity(0.12), radius: 40, y: 8)
                        
                        Text(languageManager.text("adminLogin"))
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
                    }
                }
                .offset(x: 0, y: 74)
                
                // Family Login Button
                NavigationLink(destination: FamilyView(languageManager: languageManager)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 296)
                            .fill(Color(red: 1, green: 0.66, blue: 0.66))
                            .frame(width: 186, height: 88)
                            .shadow(color: Color.black.opacity(0.12), radius: 40, y: 8)
                        
                        Text(languageManager.text("familyLogin"))
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
                    }
                }
                .offset(x: 0, y: 214)
                
                // Language Selector
                HStack(spacing: 4) {
                    Text(languageManager.text("language"))
                        .font(Font.custom("SF Pro", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                    Image(systemName: showLanguagePicker ? "chevron.down" : "chevron.up")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                }
                .onTapGesture {
                    withAnimation {
                        showLanguagePicker.toggle()
                    }
                }
                .offset(x: 107.50, y: 376)
                
                // Language Picker Popup
                if showLanguagePicker {
                    VStack(spacing: 0) {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                withAnimation {
                                    languageManager.currentLanguage = language
                                    showLanguagePicker = false
                                }
                            }) {
                                HStack {
                                    Text(language)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(
                                            languageManager.currentLanguage == language
                                            ? Color(red: 0, green: 0.53, blue: 1)
                                            : Color(red: 0.10, green: 0.10, blue: 0.10)
                                        )
                                    Spacer()
                                    if languageManager.currentLanguage == language {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            }
                            if language != languages.last {
                                Divider()
                            }
                        }
                    }
                    .frame(width: 180)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, y: 4)
                    .offset(x: 90, y: 280)
                }
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
