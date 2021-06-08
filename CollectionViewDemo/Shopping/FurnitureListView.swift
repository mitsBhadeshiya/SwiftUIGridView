//
//  FurnitureListView.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 19/02/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct FurnitureListView: View {
    
    @State var arrData: [FurnitureRow] = [
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf1", strTitle: "Wome Sofa", strPrice: "$240", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf2", strTitle: "Dada Sofa", strPrice: "$305", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf3", strTitle: "Wooden Sofa", strPrice: "$70", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf4", strTitle: "Dada Sofa", strPrice: "$140", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf5", strTitle: "Wome Sofa", strPrice: "$250", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf6", strTitle: "Wome Sofa", strPrice: "$225", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf7", strTitle: "Rest Sofa", strPrice: "$130", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf8", strTitle: "Wome", strPrice: "$310", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf9", strTitle: "Air Sofa", strPrice: "$290", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf10", strTitle: "Wome Sofa", strPrice: "$190", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf11", strTitle: "Rest Sofa", strPrice: "$175", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf12", strTitle: "Balloon Sofa", strPrice: "$500", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf13", strTitle: "Wome Sofa", strPrice: "$430", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf14", strTitle: "Balloon Sofa", strPrice: "$610", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf15", strTitle: "Gummy Sofa", strPrice: "$340", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf16", strTitle: "Gummy Sofa", strPrice: "$290", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf17", strTitle: "Pebble Sofa", strPrice: "$280", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf18", strTitle: "Gummy Sofa", strPrice: "$360", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf19", strTitle: "Balloon Sofa", strPrice: "$240", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf20", strTitle: "Gummy Sofa", strPrice: "$255", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf21", strTitle: "Pebble Sofa", strPrice: "$344", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf22", strTitle: "Rest Sofa", strPrice: "$198", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf23", strTitle: "Plume Sofa", strPrice: "$215", strDescreiption: ""),
            FurnitureColumn(imageURL: "sf24", strTitle: "Gummy Sofa", strPrice: "$247", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")]),
        FurnitureRow(cells: [
            FurnitureColumn(imageURL: "sf25", strTitle: "Wooden Sofa", strPrice: "$354", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
            FurnitureColumn(imageURL: "sf26", strTitle: "Wooden Sofa", strPrice: "$365", strDescreiption: "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry")])
    ]
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 246/255, blue: 248/255)
                .edgesIgnoringSafeArea(.bottom)
            List {
                Section(header: CustomHeader(name: "Furniture Renovation", color: Color(red: 245/255, green: 246/255, blue: 248/255))) {
                    
                    ForEach(arrData) { row in
                        HStack() {
                            ForEach(row.cells) { cell in
                                FurnitureCardCell(data: cell)
                            }
                        }
                    }                }
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

struct FurnitureListView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureListView()
    }
}

struct FurnitureCardCell: View {
    //@Binding
    @ObservedObject var data: FurnitureColumn
    
    var body: some View {
        
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    VStack {
                        Image(self.data.imageURL)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 200)
                            .padding(0)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                    }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 200, alignment: .top)
                    VStack (alignment: .leading) {
                        Text(self.data.strTitle)
                            .foregroundColor(Color(red: 35/255, green: 32/255, blue: 31/255))
                            .font(.system(size: 18)).bold()
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                        
                        Text(self.data.strDescreiption).foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255)).font(.system(size: 14))
                            .padding(EdgeInsets(top: 2, leading: 15, bottom: 0, trailing: 0))
                        
                        HStack {
                            Text(self.data.strPrice)
                            .foregroundColor(Color(red: 35/255, green: 32/255, blue: 31/255))
                            .font(.system(size: 20)).bold()
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                            
                            Spacer()
                            
                            Button(action: {
                                print(self.data.strTitle)
                                
                            }) {
                                HStack() {
                                    Image(systemName: "plus")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .scaledToFit()
                                }
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(5)
                                .background(Color(red: 124/255, green: 214/255, blue: 203/255))
                                .clipShape(Circle())
                            }.frame(width: 45, height: 45, alignment: .center)
                            
                            //Spacer(minLength: 5)
                        }.padding(5)
                    }
                }
            }.frame(width: (UIScreen.main.bounds.width - 40 ) / 2, height: 320)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
        }.shadow(color: Color.gray.opacity(0.2), radius: 4, x:  5, y: -5)
    }
}

class FurnitureRow: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var cells: [FurnitureColumn] = [FurnitureColumn]()
    
    init(cells: [FurnitureColumn]) {
        self.cells = cells
    }
}

class FurnitureColumn: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var imageURL: String = ""
    @Published var strTitle: String = ""
    @Published var strPrice: String = ""
    @Published var strDescreiption: String = ""
    
    init(imageURL: String, strTitle: String, strPrice: String, strDescreiption: String) {
        self.imageURL = imageURL
        self.strTitle = strTitle
        self.strPrice = strPrice
        self.strDescreiption = strDescreiption
    }
}
