//
//  HistoryView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-10-26.
//

import SwiftUI

var resistorValues = ["2,3,4,5,6"]
var resistorUncertainties = [""]

struct HistoryView: View {
    @State var ResistorNames = [
        "Resistor 1",
        "Resistor 2",
        "Resistor 3",
        "Resistor 4",
        "Resistor 5",
        "Resistor 6",
    ]
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                Section(header:
                    VStack(alignment: .leading) {
                    Text("Decoder Logs").font(.title2).bold().foregroundColor(.primary)
                    }
                ){
                    ForEach(ResistorNames, id: \.self) { title in
                        NavigationLink(destination: HistoryDetailView()) {
                            CustomRowView(title: title)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteAction(indexSet)
                    })
                }
                .headerProminence(.increased)
                
                Section(header:
                    VStack(alignment: .leading) {
                        Text("Converter Logs").font(.title2).bold().foregroundColor(.primary)
                    }
                ){
                    ForEach(ResistorNames, id: \.self) { title in
                        NavigationLink(destination: HistoryDetailView()) {
                            CustomRowView(title: title)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        deleteAction(indexSet)
                    })
                }
                .headerProminence(.increased)
            }
            .listStyle(.grouped)
            .navigationBarTitle("LabBook")
            .navigationBarItems(trailing: EditButton())
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    var searchResults: [String] {
            if searchText.isEmpty {
                return ResistorNames
            } else {
                return ResistorNames.filter { $0.contains(searchText) }
            }
        }

    func deleteAction(_ index: IndexSet) {
        ResistorNames.remove(atOffsets: index)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

struct CustomRowView: View {
    var title: String
    var body: some View {
        HStack {
            Image("ListIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            Text(title)
        }
    }
}

struct HeaderView: View {
  let title: String

  var body: some View {
    Text(title)
      .font(.title)
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}



