//
//  ContentView.swift
//  SwiftUI_Weather
//
//  Created by Ly Tran on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    // Hold data for struct. Don't get destroyed.
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? Color.black : Color.blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack(spacing: 8) {
                CityTextView(cityName: "Sai Gon, VN")
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 40)
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 39)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 46)
                    WeatherDayView(dayOfWeek: "THURS", imageName: "tornado", temperature: 30)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.snow.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.bolt.fill", temperature: 27)
                    
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: Color.white, textColor: Color.blue)
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek).font(.system(size: 18, weight: .medium, design: .default)).foregroundColor(.white).padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°C")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

