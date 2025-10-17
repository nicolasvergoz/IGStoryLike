import Foundation

protocol UserRepositoryProtocol {
    func fetchUsers(page: Int) async throws -> [UserEntity]
}

class UserRepository: UserRepositoryProtocol {
    
    private let remoteDataSource: UserRemoteDataSourceProtocol
    
    init(remoteDataSource: UserRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchUsers(page: Int) async throws -> [UserEntity] {
        let userPageDTO = try await remoteDataSource.fetchUsers(page: page)
        return UserMapper.toEntities(dtos: userPageDTO.users)
    }
}
