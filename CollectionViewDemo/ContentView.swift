//
//  ContentView.swift
//  CollectionViewDemo
//
//  Created by Ubrain on 05/12/19.
//  Copyright © 2019 Ubrain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let rows = Row.all()
    
    var body: some View {
        
        List {
            ForEach(rows) { row in
                HStack(alignment: .center) {
                    ForEach(row.cells) { cell in
                        Image(cell.imageURL)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }.padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
    }
}


extension Row {
    
    static func all() -> [Row] {
        
        return [
            
            Row(cells: [Cell(imageURL: "e1"), Cell(imageURL: "d1")]),
            Row(cells: [Cell(imageURL: "e2"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "d1"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "d1"), Cell(imageURL: "d2")]),
            Row(cells: [Cell(imageURL: "e1"), Cell(imageURL: "d1")]),
            Row(cells: [Cell(imageURL: "e2"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "d1"), Cell(imageURL: "e1")]),
            Row(cells: [Cell(imageURL: "d1"), Cell(imageURL: "d2")])
        ]
    }
}

struct Row: Identifiable {
    let id = UUID()
    let cells: [Cell]
}

struct Cell: Identifiable {
    let id = UUID()
    let imageURL: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
