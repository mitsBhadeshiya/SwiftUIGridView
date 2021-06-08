//
//  WomensWare.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 05/02/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct WomensWare: View {
    
    @State var arrData: [WareRow] = [
        WareRow(cells: [
            WareCell(imageURL: "1", strTitle: "Western Top-Pant", strPrice: "$25", isSelected: false),
            WareCell(imageURL: "2", strTitle: "Top", strPrice: "$12", isSelected: true)]),
        WareRow(cells: [
            WareCell(imageURL: "3", strTitle: "Fancy Top", strPrice: "$20", isSelected: false),
            WareCell(imageURL: "4", strTitle: "T-shirt", strPrice: "$30", isSelected: false)]),
        WareRow(cells: [
            WareCell(imageURL: "5", strTitle: "Pants", strPrice: "$22", isSelected: false),
            WareCell(imageURL: "6", strTitle: "Kurti", strPrice: "$15", isSelected: false)]),
        WareRow(cells: [
            WareCell(imageURL: "7", strTitle: "Suits", strPrice: "$32", isSelected: false),
            WareCell(imageURL: "8", strTitle: "Crop-top", strPrice: "$27", isSelected: false)]),
        WareRow(cells: [
            WareCell(imageURL: "9", strTitle: "Shirt", strPrice: "$35", isSelected: true)])
    ]
    
    @State var selectId:String = "Buying"
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 246/255, blue: 248/255)
                .edgesIgnoringSafeArea(.bottom)
            List {
                Section(header: CustomHeader(name: "Women's ware", color: Color(red: 245/255, green: 246/255, blue: 248/255))) {
                    
                    ForEach(arrData) { row in
                        HStack() {
                            ForEach(row.cells) { cell in
                                CategoryCardCell(data: cell, selectedIndex: self.selectId) // self.$arrData[row].cells[cell]
                            }
                        }
                    }
                    
                    /*ForEach(self.arrData.indices) { row in
                        HStack() {
                            ForEach(self.arrData[row].cells.indices) { cell in
                                CategoryCardCell(data: self.arrData[row].cells[cell], selectedIndex: self.selectId) // self.$arrData[row].cells[cell]
                            }
                        }
                    }*/
                }
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

struct WomensWare_Previews: PreviewProvider {
    static var previews: some View {
        WomensWare()
    }
}


struct CategoryCardCell: View {
    //@Binding
    @ObservedObject var data: WareCell
    let selectedIndex : String
    
    var body: some View {
        
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    ZStack {
                        Image(self.data.imageURL)
                            //.resizable()
                            
                            .foregroundColor(Color(red: 90/255, green: 90/255, blue: 228/255))
                            .frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 200)
                            .padding(0)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                        
                        Button(action: {
                            print(self.data.strTitle)
                            self.data.isSelected = !self.data.isSelected
                            
                        }) {
                            HStack() {
                                Image("heart1")
                                    .font(.system(size: 15))
                            }
                            .frame(width: 25, height: 25)
                            .padding(5)
                            .foregroundColor(self.data.isSelected ? Color.red : Color(red: 200/255, green: 200/255, blue: 200/255))
                            .background(Color.white)
                            .clipShape(Circle())
                            Spacer()
                        }//.frame(width: 25, height: 25)
                        .padding(EdgeInsets(top: 10, leading: 120, bottom: 0, trailing: 0))
                    }.padding(0)
                        .clipped()
                        .frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 200)
                    
                    Text(self.data.strTitle)
                        .foregroundColor(Color(red: 35/255, green: 32/255, blue: 31/255))
                        .font(.system(size: 19)).bold()
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                    
                    Text(self.data.strPrice).foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255)).font(.system(size: 15))
                        .padding(EdgeInsets(top: 2, leading: 15, bottom: 0, trailing: 0))
                    Spacer()
                }/*.onTapGesture {
                 print(self.data.strTitle)
                 self.data.isSelected = !self.data.isSelected
                 print(self.data.isSelected)
                 }*/
            }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 280)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
        }.shadow(color: Color.gray.opacity(0.2), radius: 4, x:  5, y: -5)
    }
}

class WareRow: ObservableObject,Identifiable { //Identifiable {
    @Published var id = UUID()
    @Published var cells: [WareCell] = [WareCell]()
    
    init(cells: [WareCell]) {
        self.cells = cells
    }
}

class WareCell: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var imageURL: String = ""
    @Published var strTitle: String = ""
    @Published var strPrice: String = ""
    @Published var isSelected: Bool = false
    
    init(imageURL: String, strTitle: String, strPrice: String, isSelected: Bool) {
        self.imageURL = imageURL
        self.strTitle = strTitle
        self.strPrice = strPrice
        self.isSelected = isSelected
    }
}
/*
class RemindersArray: ObservableObject {
    @Published var items = [WareCell]()

    func appendNewReminder(imgUrl: String, strTitle: String, strPrice:String, isSelect:Bool) {
        objectWillChange.send()
        items.append(WareCell(imageURL: imgUrl, strTitle: strTitle, strPrice: strPrice, isSelected: isSelect))
    }
}
*/

extension Sequence {
    func indexed() -> Array<(offset: Int, element: Element)> {
        return Array(enumerated())
    }
}
