//
//  ContentView.swift
//  Spotify-demo
//
//  Created by Tony Dinh on 24/7/20.
//

import SwiftUI

struct ContentView: View {
  @State private var songProgress: Double = 60

  var body: some View {
    ZStack {
      ScrollView(showsIndicators: false) {
        VStack {
          // Nav bar
          HStack {
            Button(action: {
            }, label: {
              Image(systemName: "chevron.down")
                .font(.system(size: 25))
                .foregroundColor(.black)
            })
            Spacer()
            Text("Trung Quan")
            Spacer()
            Button(action: {
            }, label: {
              Image(systemName: "slider.horizontal.3")
                .font(.system(size: 25))
                .foregroundColor(.black)
            })
          }
          Spacer(minLength: 70)
          // Cover
          Image("rose")
            .resizable()
            .scaledToFit()
            .cornerRadius(16)
          Spacer(minLength: 60)
          // Song name & artist
          VStack(alignment: .leading, spacing: 10) {
            Text("Trai dat tron khong gi la khong the")
              .font(.title)
              .bold()
              .lineLimit(1)

            Text("Trung Quan")
              .font(.subheadline)
          }
          // Slider and time
          VStack(spacing: 0) {
            Slider(value: $songProgress, in: 0...100, step: 1)
              .accentColor(Color(hex: "F29492"))
            HStack {
              Text("2:34")
              Spacer()
              Text("-1.39")
            }
          }
          // Control
          HStack {
            Button(action: {
            }, label: {
              Image(systemName: "shuffle")
                .font(.system(size: 20))
                .foregroundColor(.black)
            })
            Spacer()
            Button(action: {
            }, label: {
              Image(systemName: "backward.end.fill")
                .font(.system(size: 40))
                .foregroundColor(.black)
            })
            Spacer()
            Button(action: {
            }, label: {
              Image(systemName: "pause.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.black)
            })
            Spacer()
            Button(action: {
            }, label: {
              Image(systemName: "forward.end.fill")
                .font(.system(size: 40))
                .foregroundColor(.black)
            })
            Spacer()
            Button(action: {
            }, label: {
              Image(systemName: "repeat")
                .font(.system(size: 20))
                .foregroundColor(.black)
            })
          }
          Spacer(minLength: 30)
          // Lyrics
          VStack(alignment: .leading, spacing: 15) {
            Text("Lyrics")
              .font(.system(size: 25))
              .bold()
            Text("Ngày bên em trời đất thật tròn, vùi đầu anh ngủ sâu trong vòng tay êm ái")
              .foregroundColor(.white)
              .bold()
              .font(.system(size: 30))
            Text("Ngày yêu anh trời đất thật dài, dù em đi mãi nhưng chẳng thấy mệt nhoài")
              .foregroundColor(.black)
              .bold()
              .font(.system(size: 30))
          }
          .padding(.all, 16)
          .background(Color.white.opacity(0.06))
          .cornerRadius(16)
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
      }
    }.background(LinearGradient(gradient: Gradient(colors: [Color(hex: "F4E2D8"), Color(hex: "BA5370")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }

    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue:  Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
