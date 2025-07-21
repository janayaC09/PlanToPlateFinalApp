//
//  CustomTabBar.swift
//  Plan to Plate Sign Up
//
//  Created by DPI Student 148 on 7/16/25.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: tab
    var body: some View {
        HStack {
                    ForEach(tab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.easeInOut) {
                                selectedTab = tab
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: tab.icon)
                                    .font(.system(size: 20, weight: .semibold))
                                Text(tab.title)
                                    .font(.caption2)
                            }
                            .foregroundColor(selectedTab == tab ? .gray : .white)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.indigo)
                        .shadow(radius: 5)
                )
                .padding(.horizontal, 30)
                .frame(height: 70)
            }
        }


