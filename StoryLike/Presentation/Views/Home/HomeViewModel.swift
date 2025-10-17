import SwiftUI

@MainActor
@Observable
class HomeViewModel {
    var list: [UserStoryComponentViewData]
    var isLoading: Bool = true
    
    init(
        list: [UserStoryComponentViewData] = []
    ) {
        self.list = list
    }
}
