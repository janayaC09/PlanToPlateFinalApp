
//
//  DropdownMenu.swift
//  DropdownMenu
//
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isOptionsPresented: Bool = false
   
    
    @Binding var selectedOption: MenuOptions?

    
    let placeholder: String
 
    
    let options: [MenuOptions]
    
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isOptionsPresented.toggle()
            }
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.option)
                    .fontWeight(.medium)
                    .foregroundColor(selectedOption == nil ? .white : .white).font(.custom("InriaSans-Bold", size: 40))
                
                Spacer()
                
                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                    // This modifier available for Image since iOS 16.0
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
        }
        .padding()
        
        .overlay(alignment: .top) {
            VStack {
                if self.isOptionsPresented {
                    Spacer(minLength: 60)
                    MenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }
                }
            }
        }
        .padding(.horizontal)
        // open
        .padding(
            .bottom, self.isOptionsPresented
            ? CGFloat(self.options.count * 32) > 300
                ? 300 + 30
                : CGFloat(self.options.count * 32) + 30
            : 0
        )
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            selectedOption: .constant(nil),
            placeholder: "Diet",
            options: MenuOptions.testAllOptions
        )
    }
}
