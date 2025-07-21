
//
//  DropdownMenuListRow.swift
//  DropdownMenu
//
//

import SwiftUI

struct ListRow: View {
    let option: MenuOptions
    
    /// An action called when user select an action.
    let onSelectedAction: (_ option: MenuOptions) -> Void
    
    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
        .padding(.vertical, 5)
        .padding(.horizontal)
        .font(.custom( "InriaSans-Bold", size: 20))
    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(option: MenuOptions.testSingleOption, onSelectedAction: { _ in })
    }
}
