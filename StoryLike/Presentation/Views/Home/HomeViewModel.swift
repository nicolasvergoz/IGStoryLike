import SwiftUI

protocol HomeViewModelProtocol {
    var list: [UserStoryComponentViewData] { get set }
    var isLoading: Bool { get set }
    
    func getNextUsers() async
}

@MainActor
@Observable
final class HomeViewModel: HomeViewModelProtocol {
    private let getUsersUseCase: GetUsersUseCase
    var list: [UserStoryComponentViewData]
    var isLoading: Bool = true
    
    init(
        getUsersUseCase: GetUsersUseCase,
        list: [UserStoryComponentViewData] = []
    ) {
        self.getUsersUseCase = getUsersUseCase
        self.list = list
    }
    
    func getNextUsers() async {
        do {
            let users = try await getUsersUseCase.execute()
            list = users.map { user in
                UserStoryComponentViewData(
                    id: user.id,
                    username: user.name,
                    profilePicUrl: user.profilePictureUrl,
                    unseenStory: true
                )
            }
        } catch {
            
        }
    }
}
