//
//  DetailView.swift
//  Movie
//
//  Created by Reddy, Kovvuru Pradeep Kumar (Cognizant) on 31/07/24.
//

import SwiftUI

struct DetailView: View {
    @Environment (\.presentationMode) var presentationMode
    var movie: MovieViewModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack {
                        Circle().fill(.black)
                            .frame(width: 44, height: 44)
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 9, height: 18)
                            .foregroundColor(.white)
                    }
                }
                AsyncImage(url: movie.poster) { image in
                    image
                        .resizable()
                        .frame(width: 350, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    ZStack {
                        ProgressView()
                    }
                }
                Text("Name: \(movie.title)")
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Movie Released on \(movie.year)")
                
                Spacer()
            }
            .navigationTitle("Movie")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
           
        }
    }  
}


