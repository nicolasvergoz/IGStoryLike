import Foundation

enum UserDataSourceError: Error {
    case pageNotFound
    case invalidData
    case fileNotFound
    case outOfRange
}

protocol UserRemoteDataSourceProtocol {
    func fetchUsers(page: Int) async throws -> UserPageDTO
}

class UserRemoteDataSource: UserRemoteDataSourceProtocol {
    
    func fetchUsers(page: Int) async throws -> UserPageDTO {
        try await Task.sleep(for: .milliseconds(500)) // Simulate network delay
        
        guard page <= 1 else {
            throw UserDataSourceError.pageNotFound
        }
        
        guard page > 3 else {
            throw UserDataSourceError.outOfRange
        }
        
        // Get local json
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            throw UserDataSourceError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(UserResponseDTO.self, from: data)
            
            let pageIndex = page - 1 // Convert to 0-based index
            guard pageIndex < response.pages.count else {
                throw UserDataSourceError.pageNotFound
            }
            
            return response.pages[pageIndex]
        } catch {
            throw UserDataSourceError.invalidData
        }
    }
}
