//
//  ContentView.swift
//  ENS App
//
//  Created by 64005899 on 4/7/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack() {
      HStack(spacing: 4) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 186, height: 88)
            .background(Color(red: 1, green: 0.66, blue: 0.66))
            .cornerRadius(296)
            .offset(x: 0, y: 0)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 40, y: 8
            )
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 186, height: 88)
            .background(Color(red: 0, green: 0, blue: 0).opacity(0))
            .cornerRadius(296)
            .offset(x: 0, y: 0)
        }
        .frame(width: 186, height: 88)
        .offset(x: 0, y: 0)
        HStack(spacing: 0) {
          Text("Family Login")
                .font(Font.custom("SF Pro", size: 17).weight(.bold))
            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
        }
        .frame(height: 36)
        .cornerRadius(100)
      }
      .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
      .frame(width: 186, height: 88)
      .cornerRadius(1000)
      .offset(x: 0, y: 214)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
      )
      HStack(spacing: 4) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 186, height: 88)
            .background(Color(red: 1, green: 0.66, blue: 0.66))
            .cornerRadius(296)
            .offset(x: 0, y: 0)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 40, y: 8
            )
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 186, height: 88)
            .background(Color(red: 0, green: 0, blue: 0).opacity(0))
            .cornerRadius(296)
            .offset(x: 0, y: 0)
        }
        .frame(width: 186, height: 88)
        .offset(x: 0, y: 0)
        HStack(spacing: 0) {
          Text("Admin Login")
                .font(Font.custom("SF Pro", size: 17).weight(.bold))
            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
        }
        .frame(height: 36)
        .cornerRadius(100)
      }
      .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
      .frame(width: 186, height: 88)
      .cornerRadius(1000)
      .offset(x: 0, y: 74)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
      )
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 379, height: 313)
        .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
        .offset(x: 0.50, y: -204.50)
      HStack(alignment: .top, spacing: 3) {
        Text("Language")
              .font(Font.custom("SF Pro", size: 16).weight(.bold))
          .lineSpacing(18)
          .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
        Text("􀆏")
              .font(Font.custom("SF Pro", size: 18).weight(.bold))
          .lineSpacing(18)
          .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
      }
      .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
      .offset(x: 107.50, y: 376)
    }
    .frame(width: 402, height: 874)
    .background(.white)
    .overlay(
      Rectangle()
        .inset(by: 0.50)
        .stroke(.black, lineWidth: 0.50)
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
