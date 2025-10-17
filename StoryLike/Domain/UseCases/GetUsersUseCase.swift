import Foundation

protocol GetUsersUseCaseProtocol {
    func execute(page: Int) async throws -> [UserEntity]
}

class GetUsersUseCase: GetUsersUseCaseProtocol {
    
    private let userRepository: UserRepositoryProtocol
    private var users: [UserEntity] = []
    private var nextPageIndex: Int = 1
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func execute(page: Int) async throws -> [UserEntity] {
        let newUsers = try await userRepository.fetchUsers(page: page)
        users.append(contentsOf: newUsers)
        nextPageIndex += 1
        return users
    }
}
