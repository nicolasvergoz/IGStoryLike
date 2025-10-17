import SwiftUI

// Note: I didn't have enough time
struct UserStoriesView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
            
            // Background full-screen image
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: "https://picsum.photos/1080/1920")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 70)
            }
            
            VStack {
                // Top overlay with progress bar and profile info
                VStack(spacing: 8) {
                    // Progress bar
                    HStack(spacing: 4) {
                        // First progress bar - 50% filled
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white)
                            .frame(height: 2)
                            .cornerRadius(1)
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white.opacity(0.3))
                            .frame(height: 2)
                            .cornerRadius(1)
                        
                        // Third progress bar - empty
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white.opacity(0.3))
                            .frame(height: 2)
                            .cornerRadius(1)
                    }
                    .padding(.horizontal, 16)
                    
                    // Profile info and close button
                    HStack {
                        // Profile image and caption
                        HStack(spacing: 8) {
                            AsyncImage(url: URL(string: "https://i.pravatar.cc/300?u=1")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Circle()
                                    .fill(Color.gray)
                            }
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                            
                            Text("username")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // Close button
                        Button(
                            action: {
                                dismiss()
                            },
                            label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                        )
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 8)
                
                Spacer()
                
                // Heart button at bottom right
                HStack {
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "heart")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 32)
                        .padding(.trailing, 16)
                    }
                }
            }
        }
    }
}

#Preview {
    UserStoriesView()
}
