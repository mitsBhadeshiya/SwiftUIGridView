//
//  HealthView.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 19/02/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct HealthView: View {
    
    @State var arrData: [HealthRow] = [
        HealthRow(cells: [
            HealthColumn(imageURL: "hospital-bed", strName: "VVIP Hospital Room", isAvailable: true),
            HealthColumn(imageURL: "heart", strName: "Medical Drug Covers", isAvailable: true),
            HealthColumn(imageURL: "nurse", strName: "Skilled Nursing Facility", isAvailable: true)]),
        HealthRow(cells: [
            HealthColumn(imageURL: "hospice", strName: "Home Health Care and Hospice Care", isAvailable: true),
            HealthColumn(imageURL: "heartbeat", strName: "Control and Rehab Services", isAvailable: true),
            HealthColumn(imageURL: "ambulance", strName: "Avg Pick Up Ambulance", isAvailable: false)]),
        HealthRow(cells: [
            HealthColumn(imageURL: "tooth", strName: "Dental Health Covers", isAvailable: false),
            HealthColumn(imageURL: "test-tube", strName: "Laboratorium Test Covers", isAvailable: false),
            HealthColumn(imageURL: "device", strName: "Radiology Control Services", isAvailable: false)]),
        HealthRow(cells: [
            HealthColumn(imageURL: "eye", strName: "Eye care", isAvailable: false),
            HealthColumn(imageURL: "ear", strName: "Hearing Loss", isAvailable: false)])
    ]
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 246/255, blue: 248/255)
                .edgesIgnoringSafeArea(.bottom)
            List {
                Section(header: CustomHeader(name: "Coverages", color: Color(red: 245/255, green: 246/255, blue: 248/255))) {
                    
                    ForEach(arrData) { row in
                        HStack() {
                            ForEach(row.cells) { cell in
                                HealthCareCell(data: cell)
                            }
                        }
                    }
                }
            }.padding(EdgeInsets.init(top: 0, leading: -5, bottom: 0, trailing: 5))
                .environment(\.horizontalSizeClass, .compact)
                .onAppear {
                    UITableView.appearance().separatorColor = .clear
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
            }
        }
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}

struct HealthCareCell: View {
    //@Binding
    @ObservedObject var data: HealthColumn
    
    var body: some View {
        
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    VStack {
                        HStack {
                            Image(self.data.imageURL)
                            .resizable()
                                .foregroundColor(self.data.isAvailable ? Color(red: 75/255, green: 181/255, blue: 138/255) : Color(red: 207/255, green: 207/255, blue: 207/255))
                                .frame(width: 65, height: 65, alignment: .center)
                                .padding(0)
                                .aspectRatio(contentMode: .fit)
                        }.frame(width: (UIScreen.main.bounds.width - 60 ) / 3, height: 115)
                        
                    }.frame(width: (UIScreen.main.bounds.width - 60 ) / 3, height: 115, alignment: .top)
                        .background(self.data.isAvailable ? Color(red: 229/255, green: 241/255, blue: 237/255) : Color(red: 240/255, green: 240/255, blue: 240/255))
                        .cornerRadius(20)
                        .clipped()
                   // Spacer()
                    
                    Text(self.data.strName)
                    .foregroundColor(Color(red: 74/255, green: 74/255, blue: 74/255))
                        .font(.system(size: 14))//.bold()
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                    
                    Spacer()
                    
                }
            }.frame(width: (UIScreen.main.bounds.width - 60 ) / 3, height: 190)
                //.background(Color.white)
                .padding(1)
        }
    }
}


class HealthRow: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var cells: [HealthColumn] = [HealthColumn]()
    
    init(cells: [HealthColumn]) {
        self.cells = cells
    }
}

class HealthColumn: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var imageURL: String = ""
    @Published var strName: String = ""
    @Published var isAvailable: Bool = false
    
    init(imageURL: String, strName: String, isAvailable: Bool) {
        self.imageURL = imageURL
        self.strName = strName
        self.isAvailable = isAvailable
    }
}


// dark green 75, 181, 138
// light green 229, 241, 237
// light grey 245, 245, 245
// dark grey 207, 207, 207
