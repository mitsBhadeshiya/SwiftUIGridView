//
//  FoodListView.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 19/02/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct FoodListView: View {
    
    @State var arrData: [FoodRow] = [
        FoodRow(cells: [
            FoodColumn(imageURL: "f1", strName: "Italian Classic", strPrice: "₹110", isSelected: false, strType: "veg", strOffer: ""),
            FoodColumn(imageURL: "f2", strName: "Pizza", strPrice: "₹250", isSelected: false, strType: "veg", strOffer: "")]),
        FoodRow(cells: [
            FoodColumn(imageURL: "f3", strName: "Rice", strPrice: "₹70", isSelected: false, strType: "veg", strOffer: ""),
            FoodColumn(imageURL: "f4", strName: "Pasta", strPrice: "₹90", isSelected: false, strType: "veg", strOffer: "")]),
        FoodRow(cells: [
            FoodColumn(imageURL: "f14", strName: "Barfi", strPrice: "₹450", isSelected: false, strType: "veg", strOffer: ""),
            FoodColumn(imageURL: "f6", strName: "Chiken", strPrice: "₹150", isSelected: false, strType: "nonVeg", strOffer: "")]),
        FoodRow(cells: [
            FoodColumn(imageURL: "f7", strName: "Salad", strPrice: "₹220", isSelected: false, strType: "veg", strOffer: ""),
            FoodColumn(imageURL: "f8", strName: "Sweet", strPrice: "₹300", isSelected: false, strType: "veg", strOffer: "")]),
        FoodRow(cells: [
            FoodColumn(imageURL: "f9", strName: "Fruit Salad", strPrice: "₹170", isSelected: false, strType: "veg", strOffer: ""),
            FoodColumn(imageURL: "f10", strName: "Veg. Salad", strPrice: "₹80", isSelected: false, strType: "veg", strOffer: "")]),
        FoodRow(cells: [
            FoodColumn(imageURL: "f13", strName: "Penda", strPrice: "₹500", isSelected: false, strType: "veg", strOffer: ""),
            FoodColumn(imageURL: "f12", strName: "Rasgulla", strPrice: "₹650", isSelected: false, strType: "veg", strOffer: "")])
    ]
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 246/255, blue: 248/255)
                .edgesIgnoringSafeArea(.bottom)
            List {
               // Section(header: CustomHeader(name: "Women's ware", color: Color(red: 245/255, green: 246/255, blue: 248/255))) {
                    
                    ForEach(arrData) { row in
                        HStack() {
                            ForEach(row.cells) { cell in
                                FoodCardCell(data: cell)
                            }
                        }
                    }
                //}
            }.padding(EdgeInsets.init(top: 0, leading: -5, bottom: 0, trailing: -5))
                .environment(\.horizontalSizeClass, .compact)
                .onAppear {
                    UITableView.appearance().separatorColor = .clear
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}


struct FoodCardCell: View {
    //@Binding
    @ObservedObject var data: FoodColumn
    
    var body: some View {
        
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Image(self.data.strType)
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .scaledToFit()
                        
                        Button(action: {
                            print(self.data.strName)
                            self.data.isSelected = !self.data.isSelected
                            
                        }) {
                            HStack() {
                                Image("heart1")
                                    .font(.system(size: 15))
                                    .scaledToFit()
                            }
                            .frame(width: 25, height: 25)
                            .padding(5)
                            .foregroundColor(self.data.isSelected ? Color.red : Color(red: 200/255, green: 200/255, blue: 200/255))
                            .background(Color.white)
                            .clipShape(Circle())
                            Spacer()
                        }.padding(EdgeInsets(top: 10, leading: 120, bottom: 0, trailing: 0))
                    }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 50, alignment: .top)
                    
                    HStack {
                        Image(self.data.imageURL)
                            .foregroundColor(Color(red: 90/255, green: 90/255, blue: 228/255))
                            .frame(width: 150, height: 150, alignment: .center)
                            .padding(0)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .clipShape(Circle())
                    }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 150)
                    
                    HStack(alignment: .bottom) {
                        VStack {
                            Text(self.data.strName)
                                .foregroundColor(Color(red: 35/255, green: 32/255, blue: 31/255))
                                .font(.system(size: 14)).bold()
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            
                            Text(self.data.strPrice).foregroundColor(Color(red: 61/255, green: 193/255, blue: 115/255)).font(.system(size: 17)).bold()
                                .padding(EdgeInsets(top: 2, leading: 15, bottom: 0, trailing: 0))
                            Spacer()
                        }
                        Spacer()
                        Button(action: {
                            print(self.data.strName)
                            self.data.isSelected = !self.data.isSelected
                            
                        }) {
                            HStack() {
                                Image(systemName: "plus")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .scaledToFit()
                            }
                            .frame(width: 35, height: 35, alignment: .center)
                            .padding(5)
                            .background(Color(red: 61/255, green: 193/255, blue: 115/255))
                        }.frame(width: 45, height: 45, alignment: .bottomTrailing)
                        .cornerRadius(20, corners: [.topLeft, .bottomRight])
                    }
                }
            }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 280)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(1)
        }.shadow(color: Color.gray.opacity(0.2), radius: 4, x:  5, y: -5)
    }
}


class FoodRow: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var cells: [FoodColumn] = [FoodColumn]()
    
    init(cells: [FoodColumn]) {
        self.cells = cells
    }
}

class FoodColumn: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var imageURL: String = ""
    @Published var strName: String = ""
    @Published var strPrice: String = ""
    @Published var isSelected: Bool = false
    @Published var strType:String = ""
    @Published var strOfferPer:String = ""
    
    init(imageURL: String, strName: String, strPrice: String, isSelected: Bool, strType:String, strOffer:String) {
        self.imageURL = imageURL
        self.strName = strName
        self.strPrice = strPrice
        self.isSelected = isSelected
        self.strType = strType
        self.strOfferPer = strOffer
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
