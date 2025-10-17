import SwiftUI

struct UserStoryComponentViewData {
    let userId: Int
    let username: String
    let profilePicUrl: String
    let unseenStory: Bool
}
struct UserStoryComponent: View {
    let viewData: UserStoryComponentViewData
    
    private let size: CGFloat = 60
    private let strokeWidth: CGFloat = 3
    private let fontSize: CGFloat = 10
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewData.profilePicUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: size, height: size)
            .clipShape(Circle())
            .padding(4)
            .overlay {
                Circle()
                    .stroke(
                        Color.gray,
                        lineWidth: strokeWidth
                    )
                
                // Unseen story
                if viewData.unseenStory {
                    Circle()
                        .stroke(
                            .instagramGradient(size: size),
                            lineWidth: strokeWidth
                        )
                }
            }
            
            Text(viewData.username)
                .font(.system(size: fontSize))
        }
    }
}

#Preview {
    HStack {
        UserStoryComponent(viewData: UserStoryComponentViewData(userId: 1, username: "username_1", profilePicUrl: "https://i.pravatar.cc/300?u=1", unseenStory: true))
        UserStoryComponent(viewData: UserStoryComponentViewData(userId: 2, username: "username_2", profilePicUrl: "https://i.pravatar.cc/300?u=2", unseenStory: false))
    }
}
