//
//  XDissmissButton.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 5.02.2025.
//

import SwiftUI

struct XDissmissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName:"xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XDissmissButton()
}
