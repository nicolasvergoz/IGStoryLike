import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.list) { userStoryViewData in
                        UserStoryComponent(viewData: userStoryViewData)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            list: [
                UserStoryComponentViewData(id: 1, username: "username_1", profilePicUrl: "https://i.pravatar.cc/300?u=1", unseenStory: true),
                UserStoryComponentViewData(id: 2, username: "username_2", profilePicUrl: "https://i.pravatar.cc/300?u=2", unseenStory: false),
                UserStoryComponentViewData(id: 3, username: "username_3", profilePicUrl: "https://i.pravatar.cc/300?u=3", unseenStory: true),
                UserStoryComponentViewData(id: 4, username: "username_4", profilePicUrl: "https://i.pravatar.cc/300?u=4", unseenStory: true),
                UserStoryComponentViewData(id: 5, username: "username_5", profilePicUrl: "https://i.pravatar.cc/300?u=5", unseenStory: true),
                UserStoryComponentViewData(id: 6, username: "username_6", profilePicUrl: "https://i.pravatar.cc/300?u=6", unseenStory: true),
            ]
        )
    )
}
