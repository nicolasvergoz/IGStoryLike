import SwiftUI

struct UserStoryComponentViewData: Identifiable {
    let id: Int
    let username: String
    let profilePicUrl: String
    let unseenStory: Bool
}
struct UserStoryComponent: View {
    let viewData: UserStoryComponentViewData
    
    private let size: CGFloat = 60
    private let strokeWidth: CGFloat = 3
    private let fontSize: CGFloat = 10
    private let maxWidth: CGFloat = 74
    
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
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .frame(maxWidth: maxWidth)
    }
}

#Preview {
    HStack {
        UserStoryComponent(viewData: UserStoryComponentViewData(id: 1, username: "username_1", profilePicUrl: "https://i.pravatar.cc/300?u=1", unseenStory: true))
        UserStoryComponent(viewData: UserStoryComponentViewData(id: 2, username: "username_2", profilePicUrl: "https://i.pravatar.cc/300?u=2", unseenStory: false))
        UserStoryComponent(viewData: UserStoryComponentViewData(id: 3, username: "username_2", profilePicUrl: "https://i.pravatar.cc/300?u=3", unseenStory: true))
    }
}
