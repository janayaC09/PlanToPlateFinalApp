//
// 
//
//  Created by DPI Student 148 on 7/16/25.
//

import SwiftUI

enum tab: String, CaseIterable {
    case home
    case schedule
    case saved
    case pantry
    case tracker
    
    var icon: String {
        switch self {
        case .home : return "house"
        case .schedule : return "calendar"
        case .saved : return "heart"
        case .pantry : return "book"
        case .tracker : return "list.bullet"
        }
    }
    var title: String{
        self.rawValue.capitalized
    }
}
    
        


//#Preview {
   // tab()
//}
