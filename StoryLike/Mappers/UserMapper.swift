import Foundation

struct UserMapper {
    
    static func toEntity(dto: UserDTO) -> UserEntity {
        return UserEntity(
            id: dto.id,
            name: dto.name,
            profilePictureUrl: dto.profilePictureUrl
        )
    }
    
    static func toEntities(dtos: [UserDTO]) -> [UserEntity] {
        return dtos.map { toEntity(dto: $0) }
    }
}
