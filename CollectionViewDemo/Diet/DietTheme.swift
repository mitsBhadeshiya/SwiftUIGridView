//
//  DietTheme.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 28/01/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct DietTheme: View {
    
    let arrData: [MenuRow] = [
    .init(id: "0", cells: [
        .init(id: "0", imageURL: "cart", strTitle: "Buying"),
        .init(id: "1", imageURL: "shop", strTitle: "Selling")]),
    .init(id: "1", cells: [
        .init(id: "2", imageURL: "portfolio", strTitle: "Treds"),
        .init(id: "3", imageURL: "play", strTitle: "Videos")])]
    
    @State var selectId:IndexPath = IndexPath(row: 0, section: 0)
    
    var body: some View {
        VStack {
            ForEach(arrData) { row in
                HStack {
                    ForEach(row.cells) { cell in
//                        print("1st loop \(index)")
//                        print("2nd loop \(index2)")
                        //Text( String(index2))  .frame(width: 35.0)
                        CardCell(data: cell, selectedIndex: self.selectId)
                    }
                }
            }
        }
    }
}

struct DietTheme_Previews: PreviewProvider {
    static var previews: some View {
        DietTheme()
    }
}


struct CardCell: View {
    let data: MenuCell
    let selectedIndex : IndexPath
    
    @State var isChecked: Bool = false
    
    func toggle(){
        isChecked = !isChecked
    }
    
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                    Button(action: self.toggle){
                        VStack {
                            
                            Spacer()
                            Image(self.data.imageURL)
                                .resizable()
                                .foregroundColor( isChecked ? Color.white : Color(red: 90/255, green: 90/255, blue: 228/255))
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text(self.data.strTitle).foregroundColor( isChecked ? Color.white : Color(red: 85/255, green: 90/255, blue: 100/255)).font(.system(size: 13))
                            Spacer()
                        }
                    }.onAppear() {
                        self.isChecked = true
                        print("Clicked : \(self.data.strTitle)")
                    }
                }

            }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: (UIScreen.main.bounds.width - 40 ) / 2)
                .background(isChecked ? Color(red: 90/255, green: 90/255, blue: 228/255) : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
            
            //.clipShape(Rectangle())
        }
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 1, y: -1)
    }
}
