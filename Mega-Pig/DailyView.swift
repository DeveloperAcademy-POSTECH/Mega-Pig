//
//  DailyView.swift
//  Mega-Pig
//
//  Created by 황정현 on 2022/04/08.
//

import SwiftUI

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1)
                
        return String(self[startIndex ..< endIndex])
    }
}

struct DailyView: View {
    
    @State var ymd:String = "2XXX.01.04"
    @State var dayOfWeek:String = "월요일"
    @State var dayNum:Int = 0
    @State var count: Int = 0
    
    @State var eatAmount:CGFloat = 0
    @State var resAmount:CGFloat = 0

    @State public var buttonSelected: Int?
    
    @State var photoNum: Int = 4
    
    @State var buttons = [1, 2, 3, 4, 5, 6, 7]
    @State public var values: [Int]
    @Binding var date: Date
    
    // Struct Need List
    @State var eatAmountArr = [10, 20, 30, 40, 50, 60, 70]
    @State var nutrientArr = [[100,200,50], [300,550,440], [101, 202, 333], [121, 573, 394], [121, 573, 34], [121, 113, 255], [123, 456, 789]]
    @State var photoNumArr = [0, 3, 5, 9, 25, 14, 2]
    
    let day = ["일", "월", "화", "수", "목", "금", "토"]
    let nutrient = ["탄수화물", "단백질", "지방"]
    static let nutColor = [
        Color(red: 34 / 255, green: 66 / 255, blue: 48 / 255, opacity: 1.0),
        Color(red: 74 / 255, green: 143 / 255, blue: 103 / 255, opacity: 1.0),
        Color(red: 167 / 255, green: 204 / 255, blue: 183 / 255, opacity: 1.0)]
    let barColor = [
            Color(red: 194 / 255, green: 89 / 255, blue: 81 / 255, opacity: 1.0),
            Color(red: 194 / 255, green: 177 / 255, blue: 91 / 255, opacity: 1.0),
            Color(red: 81 / 255, green: 194 / 255, blue: 128 / 255, opacity: 1.0)]
        
    
    public var colors: [Color]
    
    var slices: [PieSliceData]
    {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated()
        {
            let degrees: Double = Double(value) * 360 / Double(sum)
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", Double(value * 100 / sum)), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    func selectedDateIs()  -> Int
    {
        count = 0
        print("##### \(dayOfWeek)")
        for date in day
        {
            if(dayOfWeek == "\(date)요일")
            {
                dayNumIs(n: count)
                return count
            }
            count += 1
        }
        return 0
    }
    
    func dayNumIs(n: Int) -> Void
    {
        for i in 0...buttons.count-1
        {
            if n == i
            {
                buttons[i] = dayNum
            }
            else
            {
                buttons[i] = dayNum - n + i
            }
            print("BUTTON NUM IS \(buttons[i])")
        }
    }
    
    func ymdChange() -> Void
    {
        let tempDay = dayNum - count + buttonSelected! < 10 ? "0" + String(dayNum - count + buttonSelected!) : String(dayNum - count + buttonSelected!)
        ymd = ymd.substring(from: 0, to: 7) + String(tempDay)
        print(ymd)
    }
    
    func barChartColorChange() -> Color
    {
        if (resAmount < eatAmount)
        {
            return barColor[0]
        }
        else if (resAmount * 0.8 < eatAmount)
        {
            return barColor[1]
        }
        else
        {
            return barColor[2]
        }
    }
    
    func barChartFullFill(w: CGFloat) -> CGFloat
    {
        if (resAmount < eatAmount)
        {
            return w * 0.8
        }
        else
        {
            return (w * 0.8) * CGFloat((Float)(eatAmount/resAmount))
        }
    }
    
    func matrixSquareNum() -> Int
    {
        for i in 2...5
        {
            if (photoNum <= i * i)
            {
                return i
            }
        }
        return 1
    }
    
    var body: some View {
        GeometryReader
        {geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let topHeight = height * 0.13
            let bottomHeight = height * 0.87
            let bottomTHeight = bottomHeight * 0.42
            let bottomBHeight = bottomHeight * 0.58
            let graphWidth = width * 0.9
            VStack(spacing: 0)
            {
                NavigationView(){}
                    .navigationTitle(ymd)
                    .navigationViewStyle(StackNavigationViewStyle())
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear() {
                        buttonSelected = selectedDateIs()
                    }.frame(alignment: .center)
                VStack()
                {
                    HStack(spacing: 0)
                    {
                        ForEach(day, id: \.self)
                        {string in
                            Text("\(string)").frame(width: width/7, height: topHeight * 0.2, alignment: .center)
                        }
                    }
                    HStack(spacing: 0)
                    {
                        ForEach(0..<7)
                        {
                            button in Button(action:{
                                    self.buttonSelected = button
                                    ymdChange()                                
                                date = Date().dateChange(d: ymd)
                                print("CHECK:D_YMD \(ymd)")
                                print("CHECK: D_change \(CalendarView().date)")
                                    photoNum = photoNumArr[buttonSelected!]
                                    dayOfWeek = day[buttonSelected!] + "요일"
                                    eatAmount = CGFloat(eatAmountArr[buttonSelected!])
                                    self.values = nutrientArr[buttonSelected!]
                                    print("PHOTO NUM IS \(photoNum)")
                            })
                            {
                                Text("\(self.buttons[button])")
                                    .frame(width: width/7, height: topHeight * 0.52, alignment: .center)
                                    .foregroundColor(.black)
                                    .background(self.buttonSelected == button ? Color.accentColor : Color.white)
                                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 1))
                            }.clipShape(Circle())
                        }
                    }
                }.frame(width: width, height: topHeight, alignment: .center)
                VStack(spacing: 10){
                    RoundedRectangle(cornerRadius: 20).stroke(Color.accentColor.opacity(0.8), lineWidth: 2).frame(width: graphWidth, height: bottomTHeight * 0.9, alignment: .center)
                        .overlay()
                    {
                        VStack(spacing: graphWidth * 0.035)
                        {
                            HStack(spacing: graphWidth * 0.1)
                            {
                                ZStack()
                                {
                                    ForEach(0..<self.values.count, id: \.self)
                                    {i in
                                        PieSliceView(pieSliceData: self.slices[i])
                                    }
                                    .frame(width: graphWidth * 0.35, height: graphWidth * 0.35)
                                    .padding(bottomTHeight * 0.03)
                                }
                                VStack(spacing: height * 0.005)
                                {
                                    ForEach(0..<self.nutrient.count, id: \.self)
                                    {i in
                                        HStack()
                                        {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(DailyView.nutColor[i])
                                                .frame(width: graphWidth * 0.07, height: graphWidth * 0.07, alignment: .leading)
                                            Text(nutrient[i]).font(.callout)
                                                .frame(alignment: .trailing)
                                        }.frame(width: graphWidth * 0.3, alignment: .leading)
                                    }
                                }
                            }
                            VStack(spacing: bottomTHeight * 0.03)
                            {
                                RoundedRectangle(cornerRadius: 10).fill(barChartColorChange().opacity(0.3))
                                    .frame(width: graphWidth * 0.8, height: bottomTHeight * 0.09)
                                    .overlay()
                                {
                                    VStack(alignment: .leading)
                                    {
                                        RoundedRectangle(cornerRadius: 10).fill(barChartColorChange())
                                            .frame(width: barChartFullFill(w: graphWidth), height: bottomTHeight * 0.09)
                                    }.frame(width: graphWidth * 0.8, height: bottomTHeight * 0.12, alignment: .leading)
                                }
                                HStack(spacing: width * 0.01)
                                {
                                    if buttonSelected != nil
                                    {
                                        Text("\((Int)(eatAmountArr[buttonSelected!]))")
                                    }
                                    else
                                    {
                                        Text("\((Int)(eatAmount))")
                                    }
                                    Text(" / ")
                                    Text("\((Int)(resAmount))")
                                    Text(" kcal")
                                }
                            }
                        }.frame(width: graphWidth, height: bottomTHeight, alignment: .center)
                    }.frame(alignment: .center)
                    VStack(spacing: 0)
                    {
                        if(photoNum != 0)
                        {
                            ForEach(0..<matrixSquareNum(), id: \.self)
                            {i in
                                HStack(spacing: 0){
                                    ForEach(0..<matrixSquareNum(), id: \.self) { j in
                                        if((j+1) * (i+1) < photoNum)
                                        {
                                            Image("temp").resizable().frame(width: graphWidth * 0.95 / CGFloat(matrixSquareNum()), height: bottomBHeight * 0.95 / CGFloat(matrixSquareNum()), alignment: .center)
                                        }
                                    }
                                }.frame(width: graphWidth * 0.95, height: bottomBHeight * 0.95 / CGFloat(matrixSquareNum()), alignment: .leading)
                                
                            }.frame(width: graphWidth * 0.95 / CGFloat(matrixSquareNum()), height: bottomBHeight * 0.95 / CGFloat(matrixSquareNum()), alignment:.center)
                        }
                        else
                        {
                            Button(action: {print("PRESSED!")}) {
                                Text("사진 추가").font(.largeTitle)
                                    .foregroundColor(Color.black.opacity(0.8))
                            }
                        }
                    }.frame(width: graphWidth, height: bottomBHeight, alignment: .center)
                        .background(Color.accentColor.opacity(0.6))
                }.frame(width: width, height: bottomHeight, alignment: .center)
                        .background(Color.accentColor.opacity(0.4))
            }.background(Color.accentColor.opacity(0.2))
        }.onDisappear()
        {
            dayNum = buttons[buttonSelected!]
//            CalendarView().date = Date().dateChange(d: ymd)
//            print("CHECK: D_Disappear \(CalendarView().date)")
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    
    static var previews: some View {
        DailyView(values: [1300, 500, 300], date: CalendarView().$date, colors: DailyView.nutColor)
    }
}
