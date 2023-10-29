//
//  ContentView.swift
//  Weather
//
//  Created by Марина on 28.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Moscow")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill", temperature: 30)
  
                
                HStack(spacing: 20) {
                    WeatherDayView(dayofWeek: "TUE", imageName: "sun.max.fill", temperature: 32)
                    WeatherDayView(dayofWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 30)
                    WeatherDayView(dayofWeek: "THU", imageName: "cloud.fill", temperature: 27)
                    WeatherDayView(dayofWeek: "FRI", imageName: "wind", temperature: 23)
                    WeatherDayView(dayofWeek: "SAT", imageName: "sun.max.fill", temperature: 33)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
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
    
    var dayofWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 5){
            Text(dayofWeek)
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 35, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding() // отступ со всех сторон границ}
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack() {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("\(temperature)°")
                .font(.system(size: 72, weight: .medium))
                .foregroundColor(.white)
                
        }
        .padding(.bottom, 30)
    }
}

