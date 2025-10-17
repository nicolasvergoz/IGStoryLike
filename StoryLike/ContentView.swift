//
//  ContentView.swift
//  StoryLike
//
//  Created by Nicolas Vergoz on 17/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [UserDTO] = []
    @State private var currentPage = 1
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    private let dataSource = UserRemoteDataSource()
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading users...")
                        .padding()
                } else if let error = errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(users, id: \.id) { user in
                        HStack {
                            AsyncImage(url: URL(string: user.profilePictureUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text("ID: \(user.id)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
                
                HStack {
                    Button("Page 1") {
                        loadUsers(page: 1)
                    }
                    .disabled(isLoading)
                    
                    Button("Page 2") {
                        loadUsers(page: 2)
                    }
                    .disabled(isLoading)
                    
                    Button("Page 3") {
                        loadUsers(page: 3)
                    }
                    .disabled(isLoading)
                }
                .padding()
            }
            .navigationTitle("Users - Page \(currentPage)")
            .onAppear {
                loadUsers(page: 1)
            }
        }
    }
    
    private func loadUsers(page: Int) {
        isLoading = true
        errorMessage = nil
        currentPage = page
        
        Task {
            do {
                let userPage = try await dataSource.fetchUsers(page: page)
                await MainActor.run {
                    self.users = userPage.users
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    if let userError = error as? UserDataSourceError {
                        switch userError {
                        case .pageNotFound:
                            self.errorMessage = "Page not found"
                        case .invalidData:
                            self.errorMessage = "Invalid data format"
                        case .fileNotFound:
                            self.errorMessage = "Users file not found"
                        }
                    } else {
                        self.errorMessage = "Unknown error occurred"
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
