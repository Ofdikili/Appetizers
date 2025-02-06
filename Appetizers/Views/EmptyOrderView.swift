//
//  EmptyOrderView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 6.02.2025.
//

import SwiftUI

struct EmptyOrderView: View {
    var emptyMesage : String
    var imageName : String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(emptyMesage)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.title3)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyOrderView(
        emptyMesage: "This is our test message", imageName: "empty-order"
    )
}
