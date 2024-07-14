//
//  ContentView.swift
//  MC3
//
//  Created by Vanessa on 11/07/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
                HStack{
                    Text("Train your footwork")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
            ScrollView{
                HStack{
                    Text("Statistic History")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                GeometryReader { geometry in
                    let data: [Double] = [10, 20, 15, 30, 25, 40, 35]
                    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]
                    
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    let maxData = data.max() ?? 1
                    let minData = data.min() ?? 0
                    
                    let xStep = width / CGFloat(data.count - 1)
                    let yScale = height / CGFloat(maxData - minData)
                    
                    ZStack {
                        // Garis sumbu X dan Y
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: height))
                            path.addLine(to: CGPoint(x: 0, y: 0))
                            
                            path.move(to: CGPoint(x: 0, y: height))
                            path.addLine(to: CGPoint(x: width, y: height))
                        }
                        .stroke(Color.gray, lineWidth: 1)
                        
                        // Garis data
                        Path { path in
                            guard data.count > 1 else { return }
                            
                            path.move(to: CGPoint(x: 0, y: height - CGFloat(data[0] - minData) * yScale))
                            
                            for index in 1..<data.count {
                                let xPosition = CGFloat(index) * xStep
                                let yPosition = height - CGFloat(data[index] - minData) * yScale
                                path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                            }
                        }
                        .stroke(Color.blue, lineWidth: 2)
                        
                        // Label sumbu X
                        ForEach(0..<data.count, id: \.self) { index in
                            Text(months[index])
                                .font(.caption)
                                .position(x: CGFloat(index) * xStep, y: height + 10)
                        }
                        
                        // Label sumbu Y
                        ForEach(0..<Int(maxData - minData) + 1, id: \.self) { index in
                            Text("\(Int(minData) + index)")
                                .font(.caption)
                                .position(x: -20, y: height - CGFloat(index) * yScale)
                        }
                    }
                    .padding()
                }
                .frame(height: 250)
                .padding(.bottom, 50.0)
           
                    Button(action: {
                        
                    }) {
                        Text("Train your footwork now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(12)
                    }
                  
                
                
                HStack{
                    Text("Tips and Trick")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10, id: \.self) { index in
                            CardView(index: index)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .padding()
        }
    }
}
struct CardView: View {
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("exampleimage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(10)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Fitness")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Personal Trainer")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Label("4.9", systemImage: "star.fill")
                        .foregroundColor(.red)
                    Label("5h 30m", systemImage: "clock")
                        .foregroundColor(.gray)
                }
                .font(.caption)
            }
            .padding([.leading, .bottom, .trailing])
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 250)
        .padding(.trailing, 10)
    }
}


#Preview {
    ContentView()
}
