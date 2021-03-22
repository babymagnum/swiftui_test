//
//  ContentView.swift
//  Shared
//
//  Created by фкшуа on 07/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    private var listDayWeather = [
        DayWeatherWeekModel(id: 0, dayOfWeek: "SUN", systemNameImage: "cloud.sun.fill", degree: 74),
        DayWeatherWeekModel(id: 1, dayOfWeek: "MON", systemNameImage: "wind", degree: 66),
        DayWeatherWeekModel(id: 2, dayOfWeek: "TUE", systemNameImage: "cloud.sun.fill", degree: 71),
        DayWeatherWeekModel(id: 3, dayOfWeek: "WED", systemNameImage: "cloud.sun.fill", degree: 67),
        DayWeatherWeekModel(id: 4, dayOfWeek: "THU", systemNameImage: "cloud.sun.fill", degree: 69),
        DayWeatherWeekModel(id: 5, dayOfWeek: "FRI", systemNameImage: "cloud.sun.fill", degree: 69),
        DayWeatherWeekModel(id: 6, dayOfWeek: "SAT", systemNameImage: "cloud.sun.fill", degree: 69),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(city: "Cupertino, CA")
                
                MainWeatherDayView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", degree: 79)
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 15) {
                        ForEach(listDayWeather, id: \.id) { result in
                            WeatherDayView(item: result)
                        }
                    }.padding([.leading, .trailing], 24)
                }
                
                Spacer()
                
                ButtonChangeDayTime(textColor: .blue, backgroundColor: .white, title: "Change Day Time", action: { text in
                    isNight.toggle()
                })
                
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
    
    var item: DayWeatherWeekModel
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
            Text(item.dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(.bottom, 10)
            Image(systemName: item.systemNameImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 36, height: 36)
                .padding(.bottom, 10)
            Text("\(item.degree)°")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 10)
                .lineLimit(1)
        }
    }
}

struct MainWeatherDayView: View {
    
    var imageName: String
    var degree: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text("\(degree)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct CityTextView: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}
