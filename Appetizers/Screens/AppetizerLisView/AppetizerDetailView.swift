//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Ömer Faruk Dikili on 4.02.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order : Order
    let appiter: Appetizer
    @Binding var isShowingDetail : Bool
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appiter.imageURL)
                .aspectRatio(contentMode:.fit)
                .frame(width: 300, height:225)
            VStack{
                Text(appiter.name)
                    .font(.title2).fontWeight(.semibold)
                Text(appiter.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
            }
           
            HStack(alignment:.center, spacing: 40){
            
                    NutritionInfoView(title: "Calories", value: appiter.calories)
                    NutritionInfoView(title: "Carbs", value: appiter.carbs)
                    NutritionInfoView(title: "Protein", value: appiter.protein)
                   
                
            }
            Spacer()
            
            Button{
                order.addItem(appiter)
                isShowingDetail = false

            } label: {
                GeneralAppButtonLabel(
                    title: "$ \(appiter.price) - Add to Order"
                   )
            }
            .buttonStyle(.borderedProminent)
            .padding()


        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button{
                isShowingDetail = false

                
            }label: {
                XDissmissButton()
            }
                    ,alignment:.topTrailing)
    }
}

struct NutritionInfoView : View {
    var title : String
    var value : Int
    var body : some View{
        VStack(spacing:5){
            Text(title).bold()
                .font(.caption)
            Text("\(value)").foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}



#Preview {
    AppetizerDetailView(appiter: MockData.orderItemOne,isShowingDetail: .constant(true))
}
