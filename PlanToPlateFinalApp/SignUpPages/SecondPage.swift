//
//  Plan to Plate Sign Up
//
//  Created by DPI Student 148 on 7/11/25.
//

import SwiftUI

struct SecondPage: View {
    @State private var selectedItems: Set<String> = [] // Multi-select
    let baseProgress: CGFloat = 80
    var percent: CGFloat {
        selectedItems.isEmpty ? baseProgress : 100
    }
    
    // List of images and keys
    let foodItems: [(key: String, imageName: String)] = [
        ("shrimp", "Shrimp food"),
        ("salmon", "Salmon stir fry"),
        ("pasta", "vegan pasta"),
        ("pizza", "pizza"),
        ("soup", "soup"),
        ("burger", "veggie burger")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack {
                    // Top progress + title
                    VStack(spacing: 10) {
                        Text("\(Int(percent))%")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 20))
                            .padding(.top, 20)
                        
                        ProgressBar(width: 300, height: 30, percent: percent, color1: .indigo, color2: .mint)
                            .padding(.horizontal)
                        
                        Text("Pick foods you enjoy!")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 35))
                            .padding(.top, 10)
                            .padding(.bottom,40)
                    
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 30) {
                       
                        ForEach(0..<((foodItems.count + 1) / 2), id: \.self) { row in
                            HStack(spacing: 20) {
                                ForEach(0..<2) { col
                                    in let index = row * 2 + col
                                    if index < foodItems.count {
                                        let item = foodItems[index]
                                        
                                        Button(action: {
                                            if selectedItems.contains(item.key) {
                                                selectedItems.remove(item.key)
                                            }
                                            else {
                                                selectedItems.insert(item.key)
                                            }
                                        }) {
                                            Image(item.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 140, height: 130)
                                                .clipped()
                                                .cornerRadius(30)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .stroke(selectedItems.contains(item.key) ? Color.white : Color.clear, lineWidth: 4)
                                                )
                                        }
                                    }
                                    else {
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                        .padding(.top, 40)
                    NavigationLink(destination:
                                    Home()
                        .navigationBarBackButtonHidden(true)
                    ) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

#Preview {
    SecondPage()
}
