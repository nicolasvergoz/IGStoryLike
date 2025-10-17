import Foundation

struct UserMapper {
    
    static func toEntity(from dto: UserDTO) -> UserEntity {
        return UserEntity(
            id: dto.id,
            name: dto.name,
            profilePictureUrl: dto.profilePictureUrl
        )
    }
    
    static func toEntities(from dtos: [UserDTO]) -> [UserEntity] {
        return dtos.map { toEntity(from: $0) }
    }
}