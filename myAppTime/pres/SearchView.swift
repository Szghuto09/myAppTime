//
//  SearchView.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 3/6/21.
//

import SwiftUI

struct SearchView: View {
    
    let layout = [
        GridItem(.flexible())
    ]
    
    @ObservedObject var locationListViewModel = LocationListViewModel()
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter Search Text", text: $locationListViewModel.searchText)
                    .padding(.horizontal, 40)
                    .frame(width: UIScreen.main.bounds.width - 110, height: 45, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0.9294475317, green: 0.9239223003, blue: 0.9336946607, alpha: 1)))
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                    )
                Spacer()

        }.padding().padding(.top, 30)
            
            if locationListViewModel.locationsFound.count > 0 {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 12) {
                        ForEach(locationListViewModel.locationsFound, id: \.id) { item in
                            ItemView(item: item)
                        }
                    }
                }
            } else {
                
                Spacer()
                
                Text("Please Search Your Item")
                
                Spacer()
            }
        }
        .background(Color(#colorLiteral(red: 0.9758560663, green: 0.9758560663, blue: 0.9758560663, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
            
    }
}
    
struct ItemView: View {
    let item: LocationViewModel
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 5) {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 80)
                    .frame(width: 70)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.nameCity)
                        .font(.body)
                        .fontWeight(.semibold)
                   
                    Text("lat:\(item.lat)")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .font(.caption)
                    Text("lon:\(item.lon)")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .font(.caption)
                }
                
                Spacer()
                
                
                
            }
        }
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.11), radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 7)
        )
        .padding(.horizontal, 10)
        .animation(.easeIn)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

