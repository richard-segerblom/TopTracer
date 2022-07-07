//
//  Logout.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import SwiftUI

struct Logout: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.title)
            Button("Logout", action: {
                withAnimation {
                    viewModel.logout()
                }
            })
            
            if let image = viewModel.image {
                AsyncImage(url: image.url) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 300, maxHeight: 200)
                } placeholder: {
                    ProgressView()
                }
                
                Text(image.title)
                Text(image.author)
            }
        }.onAppear {
            viewModel.fetchRandomImage()
        }
    }
}

struct Logout_Previews: PreviewProvider {
    static var previews: some View {
        Logout(viewModel: .init(authenticationService: AuthenticationService(),
                                giphyService: GiphyService(),
                                logoutAction: { }))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
