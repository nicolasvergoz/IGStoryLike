import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModelProtocol
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.list) { userStoryViewData in
                        UserStoryComponent(viewData: userStoryViewData)
                            .onTapGesture {
                                isPresented = true
                            }
                            .onAppear {
                                if userStoryViewData.id == viewModel.list.last?.id {
                                    Task {
                                        await viewModel.getNextUsers()
                                    }
                                }
                            }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .fullScreenCover(isPresented: $isPresented) {
            UserStoriesView()
        }
        .task {
            await viewModel.getNextUsers()
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModelFactory.makeViewModel()
    )
}
