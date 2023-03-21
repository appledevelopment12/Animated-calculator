//
//  KeyView.swift
//  AnimatedCalculator
//
//  Created by Rajeev on 11/02/23.
//

import SwiftUI

struct KeyView: View {
    
    @State var value="0"
    @State var runningNumber=0
    @State var currentOperation:Operation = .none
    @State private var changeColor = false
    
    
    let buttons : [[Keys]]=[
        [.clear,.negative,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.substract],
        [.one,.two,.three,.add],
        [.zero,.decimal,.equal]
    ]
    var body: some View {
        VStack{
            Spacer()
            HStack {
                
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ?
                                     Color("num").opacity(0.4) :
                                        Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350,height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(),value: changeColor)
                    .onAppear(perform: {
                        
                        self.changeColor.toggle()
                    })
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                             
                    )
            }.padding()
            
            ForEach(buttons,id: \.self){ row in
                HStack(spacing:12){
                    ForEach(row,id:\.self){elem in
                        Button {
                    self.didTap(button:elem)
                        }
                    label:{
                        Text(elem.rawValue)
                            .font(.system(size:30))
                            .frame(width:self.getWidth(elem:elem),height:60)
                            .backgroundStyle(elem.buttonColor)
                            .foregroundColor(.black)
                            .cornerRadius(30)
                            .shadow(color:.purple.opacity(0.8),radius:30)
                    }
                    }
                    
                }.padding(.bottom,4)
            }
            
        }
        
        
    }
    func getWidth(elem:Keys)->CGFloat{
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    func didTap(button:Keys)
    {
        switch button{
        case.add,.substract,.multiply,.divide,.equal:
            if button == .add
            {
                self.currentOperation = .addd
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .substract
            {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply
            {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide
            {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal
            {
                let runningValue = self.runningNumber
                let currentVlaue = Int(self.value) ?? 0
                switch self.currentOperation {
                case.addd: self.value = "\(runningValue+currentVlaue)"
                case.subtract: self.value = "\(runningValue-currentVlaue)"
                case.multiply: self.value = "\(runningValue*currentVlaue)"
                case.divide: self.value = "\(runningValue/currentVlaue)"
                case.none:
                    break
                    
                }
                
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal,.negative,.percent:
            
            break
        default:
            let number = button.rawValue
            if self.value=="0"
            {
            value=number
            }
            else {
                self.value="\(self.value)\(number)"
            }
        }
    }
}


struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
