//
//  PersonGridList.swift
//  CollectionViewDemo
//
//  Created by UBS_003 on 28/01/21.
//  Copyright © 2021 Ubrain. All rights reserved.
//

import SwiftUI

struct PersonGridList: View {
    
    let data: [CellData] = [
        .init(id: "0", data:[
            .init(id: "0", name: "SteveJobs", imageName: "SteveJobs"),
            .init(id: "1", name: "Satya Nadella", imageName: "SatyaNadella")]),
        .init(id: "1", data: [
            .init(id: "2", name: "Jeff Bezos", imageName: "JeffBezos"),
            .init(id: "3", name: "Tim Cook", imageName: "TimCook")]),
        .init(id: "0", data:[
            .init(id: "0", name: "SteveJobs", imageName: "SteveJobs"),
            .init(id: "1", name: "Satya Nadella", imageName: "SatyaNadella")]),
        .init(id: "1", data: [
            .init(id: "2", name: "Jeff Bezos", imageName: "JeffBezos"),
            .init(id: "3", name: "Tim Cook", imageName: "TimCook")]),
        .init(id: "0", data:[
            .init(id: "0", name: "SteveJobs", imageName: "SteveJobs"),
            .init(id: "1", name: "Satya Nadella", imageName: "SatyaNadella")]),
        .init(id: "1", data: [
            .init(id: "2", name: "Jeff Bezos", imageName: "JeffBezos"),
            .init(id: "3", name: "Tim Cook", imageName: "TimCook")]),
        .init(id: "0", data:[
            .init(id: "0", name: "SteveJobs", imageName: "SteveJobs"),
            .init(id: "1", name: "Satya Nadella", imageName: "SatyaNadella")]),
        .init(id: "1", data: [
            .init(id: "2", name: "Jeff Bezos", imageName: "JeffBezos"),
            .init(id: "3", name: "Tim Cook", imageName: "TimCook")])]
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                List {
                    ForEach(self.data) { items in
                        HStack {
                            ForEach(items.data) { item in
                                CollectionView(data: item)
                                    .padding(0)
                                    .frame(width: geometry.size.width / 2 , height: geometry.size.width / 2, alignment: .leading)
                            }
                        }
                    }
                }
                .onAppear {
                    UITableView.appearance().separatorColor = .clear
                }
                .navigationBarTitle("CollectionView")
            }
        }
    }
}

struct PersonGridList_Previews: PreviewProvider {
    static var previews: some View {
        PersonGridList().environment(\.colorScheme, .light)
    }
}


struct CollectionView: View {
    let data: DataModel
    var body: some View {
       // GeometryReader { geometry in
            VStack {
                
                HStack {
                    //  ForEach(0..<2) { items in
                    
                    VStack {
                        
                        Spacer()
                        
                        Image(self.data.imageName)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.yellow)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        Spacer()
                        Text(self.data.name)
                        Spacer()
                        
                    }
                    //}.padding(.bottom, 12)
                    
                    
                    /* HStack {
                     Spacer()
                     Text(self.data.name)
                     Spacer()
                     /*Text(self.data.name)
                     Spacer()*/
                     }*/
                }
            }
        }
    //}
}

struct CellData: Identifiable {
    let id: String
    let data: [DataModel]
}

struct DataModel: Identifiable {
    let id: String
    let name: String
    let imageName: String
}
