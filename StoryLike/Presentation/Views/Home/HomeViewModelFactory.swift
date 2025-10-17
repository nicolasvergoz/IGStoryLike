import SwiftUI

enum HomeViewModelFactory {
    static func makeViewModel() -> HomeViewModelProtocol {
        let remoteDataSource = UserRemoteDataSource()
        let repository = UserRepository(remoteDataSource: remoteDataSource)
        let userCase = GetUsersUseCase(userRepository: repository)
        return HomeViewModel(getUsersUseCase: userCase)
    }
}
