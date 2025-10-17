import Foundation

protocol GetUsersUseCaseProtocol {
    func execute() async throws -> [UserEntity]
}

class GetUsersUseCase: GetUsersUseCaseProtocol {
    
    private let userRepository: UserRepositoryProtocol
    private var users: [UserEntity] = []
    private var nextPageIndex: Int = 1
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [UserEntity] {
        do {
            let newUsers = try await userRepository.fetchUsers(page: nextPageIndex)
            users.append(contentsOf: newUsers)
            nextPageIndex += 1
            return users
        } catch {
            if case UserDataSourceError.outOfRange = error {
                print("Reached end of pages, restarting from page 1...")
                nextPageIndex = 1
                let newUsers = try await userRepository.fetchUsers(page: nextPageIndex)
                users.append(contentsOf: newUsers)
                nextPageIndex += 1
                return users
            }
            throw error
        }
    }
}
