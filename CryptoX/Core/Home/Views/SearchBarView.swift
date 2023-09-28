//
//  SearchBarView.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/27/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String 
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? Color.secondaryTextColor : Color.myAccentColor)
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundColor(Color.myAccentColor)
                .autocorrectionDisabled(true)
        }
                .font(.headline)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .fill(Color.backgroundColor)
                    .shadow(color: .myAccentColor.opacity(0.12), radius: 10, x: 0, y: 0)
                )
                .padding()
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: -10)
                        .foregroundColor(Color.myAccentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                    ,alignment: .trailing
                )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
        }
    }
}
