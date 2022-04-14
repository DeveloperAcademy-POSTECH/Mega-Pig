//
//  CalendarView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//
import Combine
import SwiftUI

extension Date {
    func getYMDString(d: Date) -> String {
            let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "YYYY.MM.dd"
            let strDate = dateFormatter.string(from: d)
            return strDate
    }
    
    func dayOfMonth(d: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        print("Current Date Is \(Int(dateFormatter.string(from: d))!)")
        return Int(dateFormatter.string(from: d))!
    }
    
    func dayNameOfWeek(d: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: d)
    }
    
    func dateChange(d: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "YYYY-MM-dd"
        print("IN METHOD::: \(dateFormatter.date(from: d)!)")
        return dateFormatter.date(from: d)!
    }
}

struct CalendarView: View {
    static var dateCo = Date()
    
    @State public var date = Date()
    @State var navigationActive = false
    @State var isViewDisplayed = false
    
    let titleSize: CGFloat = 28
    let sTitleSize: CGFloat = 20
    let word: CGFloat = 22
    
    let components: [String] = ["목표 칼로리", "일일 평균 섭취량", "목표 달성 일수", "이번 달의 원픽"]
    let unit: [String] = ["kcal", "개"]
    
    @State private var comValue: [CGFloat] = [2300, 2205.5, 2, 10]
    
    var body: some View {
        GeometryReader
        { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let componentWidth = width * 0.55
            let valueWidth = width * 0.25
            let kcalWidth = width * 0.2
            let topHeight = height * 0.5
            let bottomHeight = height * 0.5
            NavigationView
            {
                VStack(spacing: 0)
                {
                    Section
                    {
                        DatePicker(
                            "Start Date",
                            selection: $date,
                            displayedComponents: [.date]
                            
                        )
                        .datePickerStyle(.graphical)
                        .frame(width: width, height: topHeight, alignment: .center)
                        .onTapGesture(count: 2)
                        {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05)
                            {navigationActive = true}
                        }
                        NavigationLink("", destination: DailyView(
                            ymd: Date().getYMDString(d: date),
                            dayOfWeek: Date().dayNameOfWeek(d: date)!,
                            dayNum: Date().dayOfMonth(d: date),
                            eatAmount: 100,
                            resAmount: 50,
                            photoNum: 0,
                            values: [1300, 500, 300],
                            date: $date,
                            colors: DailyView.nutColor
                        ),
                                       isActive: $navigationActive)
                    }
                    .navigationBarHidden(true)
                    
                    VStack(spacing: 0)
                    {
                        Label("Summary", systemImage: "").font(.system(size: titleSize) ).frame(maxWidth: .infinity, alignment: .center).padding(.vertical, (bottomHeight * 0.02)).frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                        
                        HStack
                        {
                            Label(components[0], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                            Label(String(format: "%.f", comValue[0]), systemImage: "").font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                            Label(unit[0], systemImage: "").padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                        }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                        HStack
                        {
                            Label(components[1], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                            Label(String(format: "%.f", comValue[1]), systemImage: "").font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                            Label(unit[0], systemImage: "").padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                        }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                        HStack
                        {
                            Label(components[2], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth, alignment: .leading)
                            Label(String(format: "%.f", comValue[2]), systemImage: "").font(.system(size: word)).frame(maxWidth: valueWidth, alignment: .trailing)
                            Label(unit[1], systemImage: "").padding(.trailing).font(.system(size: word)).frame(maxWidth: kcalWidth, alignment: .trailing)
                        }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                        HStack
                        {
                            Label(components[3], systemImage: "").font(.system(size: sTitleSize)).frame(maxWidth: componentWidth*0.58, alignment: .leading)
                            Label("빠네크림파스타/3500\(unit[0])", systemImage: "").padding(.trailing).font(.system(size: word)).frame(maxWidth: valueWidth*3, alignment: .trailing)
                        }.frame(width: width, height: bottomHeight * 0.2, alignment: .center)
                    }.background(Color.accentColor)
                        .frame(width: width, height: bottomHeight, alignment: .top)
                }
            }
        }
        .onChange(of: date, perform: {newDate in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05)
            {navigationActive = true}
        })
        .onDisappear()
        {
            if(isViewDisplayed == false)
            {
                isViewDisplayed = true
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
