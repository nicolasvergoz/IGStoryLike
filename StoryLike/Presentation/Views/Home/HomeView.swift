import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModelProtocol
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.list) { userStoryViewData in
                        UserStoryComponent(viewData: userStoryViewData)
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
