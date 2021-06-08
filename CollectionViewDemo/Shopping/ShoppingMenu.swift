//
//  ShoppingMenu.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 28/01/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct ShoppingMenu: View {
    let arrData: [MenuRow] = [
        .init(id: "0", cells: [
            .init(id: "0", imageURL: "cart", strTitle: "Buying"),
            .init(id: "1", imageURL: "shop", strTitle: "Selling")]),
        .init(id: "1", cells: [
            .init(id: "2", imageURL: "pizza", strTitle: "Fast-Food"),
            .init(id: "3", imageURL: "gift", strTitle: "Gifts")]),
        .init(id: "2", cells: [
            .init(id: "4", imageURL: "music", strTitle: "Audios"),
            .init(id: "5", imageURL: "play", strTitle: "Videos")]),
        .init(id: "3", cells: [
            .init(id: "6", imageURL: "portfolio", strTitle: "Treds"),
            .init(id: "7", imageURL: "deals", strTitle: "Deals")])]
    
    @State var selectId:String = "Buying"
    
    var body: some View {
        
        ZStack {
            Color(red: 245/255, green: 246/255, blue: 248/255)
                .edgesIgnoringSafeArea(.bottom)
            
            List {
                Section(header: CustomHeader(name: "Choose your area", color: Color(red: 245/255, green: 246/255, blue: 248/255))) {
                    ForEach(arrData) { row in
                        HStack() {
                            ForEach(row.cells) { cell in
                                MenuCardCell(data: cell, selectedIndex: self.selectId)
                                    .shadow(color: Color.gray.opacity(0.2), radius: self.selectId == cell.strTitle ? 10 : 1, x: self.selectId == cell.strTitle ? -10 : 10, y: self.selectId == cell.strTitle ? -10 : 10)
                                    .animation(.easeInOut)
                                    .onTapGesture {
                                        print(cell.strTitle)
                                        /*if self.selectId {
                                         self.selectId = false
                                         } else {
                                         self.selectId = true
                                         }*/
                                        self.selectId = cell.strTitle
                                }
                            }
                        }
                    }
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

struct CustomHeader: View {
    let name: String
    let color: Color

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(name)
                    .foregroundColor(Color(red: 85/255, green: 90/255, blue: 100/255))
                    .padding(20)
                    .font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
            }
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, height: 44)
            .padding(0).background(FillAll(color: color))
            
        
    }
}

struct FillAll: View {
    let color: Color
    
    var body: some View {
        GeometryReader { proxy in
            self.color.frame(width: proxy.size.width * 1.3)//.fixedSize()
        }
    }
}

struct ShoppingMenu_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingMenu().environment(\.colorScheme, .light)
    }
}

struct MenuCardCell: View {
    let data: MenuCell
    let selectedIndex : String
    
   // @State var isChecked: Bool = false
    
    /*func toggle(){
        isChecked = !isChecked
    }*/
    
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                   // Button(action: self.toggle){
                        VStack {
                            
                            Spacer()
                            Image(self.data.imageURL)
                                .resizable()
                                .foregroundColor( data.strTitle == selectedIndex ? Color.white : Color(red: 90/255, green: 90/255, blue: 228/255))
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text(self.data.strTitle).foregroundColor(data.strTitle == selectedIndex ? Color.white : Color(red: 85/255, green: 90/255, blue: 100/255)).font(.system(size: 13))
                            Spacer()
                        }
                    /*}.onAppear() {
                        self.selectedIndex = true
                        print("Clicked : \(self.data.strTitle)")
                    }*/
                }

            }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: (UIScreen.main.bounds.width - 40 ) / 2)
                .background(data.strTitle == selectedIndex ? Color(red: 90/255, green: 90/255, blue: 228/255) : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
            
            //.clipShape(Rectangle())
        }
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x:  1, y: -1)
    }
}

struct MenuRow: Identifiable {
    let id: String
    let cells: [MenuCell]
}

struct MenuCell: Identifiable {
    let id: String
    let imageURL: String
    let strTitle: String
}
