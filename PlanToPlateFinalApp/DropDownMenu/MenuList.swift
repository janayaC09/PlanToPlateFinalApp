
//
//  DropdownMenuList.swift
//  DropdownMenu
//
//

import SwiftUI

struct MenuList: View {
    let options: [MenuOptions]
    
    let onSelectedAction: (_ option: MenuOptions) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(options) { option in
                    ListRow(option: option, onSelectedAction: self.onSelectedAction)
                }
            }
        }
        
        .frame(height: CGFloat(self.options.count * 32) > 300
               ? 300
               : CGFloat(self.options.count * 32)
        )
        .padding(.vertical, 5)
        .overlay {
            //RoundedRectangle(cornerRadius: 5)
                //.stroke(.white, lineWidth: 2)
        }
    }
}

struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(options: MenuOptions.testAllOptions, onSelectedAction: { _ in })
    }
}
