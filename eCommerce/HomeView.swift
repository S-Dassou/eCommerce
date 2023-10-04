//
//  HomeView.swift
//  eCommerce
//
//  Created by shafique dassu on 02/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    fileprivate func NavigationBarView() -> some View {
        HStack {
            Spacer()
            Text("E-Commerce App")
            Spacer()
        }
        .overlay(alignment: .trailing) {
            Button(action: {
                
            }, label: {
                ZStack {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(Color.black)
                    ZStack {
                        Circle()
                        Text("1")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.white)
                    }
                    .offset(CGSize(width: 10, height: -10))
                }
            })
            .padding(.trailing)
        }
    }
    var body: some View {
        VStack {
            NavigationBarView()
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .frame(width: .infinity)
                .clipped()
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
