//
//  Home.swift
//  WalletUI
//
//  Created by 张亚飞 on 2021/6/23.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = "Incomings"
    
    @Namespace var topAnimation
    @Namespace var weekAnimation
    
    @State var weeks : [Week] = []
    
    @State var currentDay: Week = Week(day: "", date: "")
    var body: some View {
            
        VStack {
            
            HStack {
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "rectangle.grid.2x2")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                }

            }
            .padding()
            
            HStack {
                
                Text("Incomings")
                    .fontWeight(.bold)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(
                        
                        ZStack {
                        
                            if currentTab == "Incomings" {
                                
                                Color.white.cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: topAnimation)
                            }
                            
                        }
                    )
                    .foregroundColor(currentTab == "Incomings" ? Color.black : Color.white)
                    .onTapGesture {
                        
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                            
                            currentTab = "Incomings"
                        }
                    }
                
                
                Text("Outgoings")
                    .fontWeight(.bold)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(
                        
                        ZStack {
                        
                            if currentTab == "Outgoings" {
                                
                                Color.white.cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: topAnimation)
                            }
                        }
                    )
                    .foregroundColor(currentTab == "Outgoings" ? Color.black : Color.white)
                    .onTapGesture {
                        
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                            
                            currentTab = "Outgoings"
                        }
                    }
                
            }
            .padding(.vertical, 7)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.3))
            .cornerRadius(10)

            HStack(spacing: 37) {
                
                ZStack {
                    
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 22)
                    
                    Circle()
                        .trim(from: 0, to: 0.6)
                        .stroke(Color.yellow, style: StrokeStyle(lineWidth: 22, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                    
                    Image(systemName: "dollarsign.square.fill")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 180)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Spend")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.6))
                    
                    Text("$300")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Maximum")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.6))
                    
                    Text("$500")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
            }
            .padding()
            .padding(.leading)
            
            
            VStack {
                
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 100, height: 2)

                HStack(spacing:15) {

                    VStack(alignment: .leading, spacing: 10) {

                        Text("Your Balance")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        Text("May 1 2021")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Button {

                    } label: {

                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                    }

                }

                HStack {

                    Text("$22,306.07")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Spacer()

                    Image(systemName: "arrow.up")
                        .foregroundColor(.gray)

                    Text("14%")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                }
                .padding(.top, 8)
                
                HStack(spacing:0) {
                    
                    ForEach(weeks) { week in
                        
                        VStack(spacing: 12) {
                            
                            Text(week.day)
                                .fontWeight(.bold)
                                .foregroundColor(currentDay.id == week.id ? Color.white.opacity(0.8) : .black)
                            
                            Text(week.date)
                                .fontWeight(.bold)
                                .foregroundColor(currentDay.id == week.id ? Color.white.opacity(0.8) : .black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(
                            
                            ZStack {
                                
                                if currentDay.id == week.id  {
                                    
                                    Color.yellow
                                        .matchedGeometryEffect(id: "WEEK", in: weekAnimation)
                                }
                            }
                        )
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            withAnimation {
                                currentDay = week
                            }
                        }
                    }
                }
                .padding(.top, 10)
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 50)
                        .background(Color("bg"))
                        .clipShape(Capsule())
                }
                .padding(.top)

                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .background(
                Color.white
                    .clipShape(CustomShap(corners: [.topLeft, .topRight], radius: 35))
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            
        }
        .background(Color("bg").ignoresSafeArea())
        .onAppear {
            getWeekDays()
        }
    }
    
    
    // getting current week 7 days ...
    
    func getWeekDays() {
        
        let calender = Calendar.current
        
        let week = calender.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let startDate = week?.start else {
            
            return
        }
        
        // whole week days...
        
        for index in 0..<7 {
            
            guard let date = calender.date(byAdding: .day, value: index, to: startDate) else {
                return
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE"
            var day = formatter.string(from: date)
            day.removeLast()
            
            formatter.dateFormat = "dd"
            let dateString = formatter.string(from: date)
            
            weeks.append(Week(day: day, date: dateString))
        }
        
        self.currentDay = weeks.first!
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
