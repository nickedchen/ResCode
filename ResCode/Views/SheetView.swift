//
//  SheetView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-11-02.
//

import SwiftUI

struct SheetView: View {
    @State var colors = [
        ColorType(name: "Black", value: "0", resistance: "1 Ω", tolerance: "± 1%", TCR: "-", id: 1),
        ColorType(name: "Brown", value: "1", resistance: "10 Ω", tolerance: "± 2%", TCR: "100",id: 2),
        ColorType(name: "Red", value: "2", resistance: "100 Ω", tolerance: "-", TCR: "5",id: 3),
        ColorType(name: "Orange", value: "3", resistance: "100 Ω", tolerance: "-", TCR: "15",id: 4),
        ColorType(name: "Yellow", value: "4", resistance: "10k Ω", tolerance: "-", TCR: "25",id: 5),
        ColorType(name: "Green", value: "5", resistance: "100k Ω", tolerance: "± 0.5%", TCR: "-",id: 6),
        ColorType(name: "Blue", value: "6", resistance: "1M Ω", tolerance: "± 0.25%", TCR: "10",id: 7),
        ColorType(name: "Violet", value: "7", resistance: "1M Ω", tolerance: "± 0.10%", TCR: "5",id: 8),
        ColorType(name: "Grey", value: "8", resistance: "-", tolerance: "± 0.05 %", TCR: "-",id: 9),
        ColorType(name: "White", value: "9", resistance: "1G Ω", tolerance: "-", TCR: "-",id: 10),
        ColorType(name: "Gold", value: "-", resistance: "0.10 Ω", tolerance: "± 5.00 %", TCR: "-",id: 11),
        ColorType(name: "Silver", value: "-", resistance: "0.01 Ω", tolerance: "± 10.0 %", TCR: "-",id: 12),
        ColorType(name: "None", value: "-", resistance: "-", tolerance: "± 20.00%", TCR: "-",id: 13),
    ]


    @State private var searchText = ""
    @State private var updatedColors: [ColorType] = []
    @State private var ascend = true
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Spacer()
            HStack(spacing: 10) {
                Button {
                    ascend.toggle()
                if ascend {
                    colors.sort{$0.id < $1.id}
                    } else {
                    colors.sort{$0.id > $1.id}
                    }
                } label: {
                    Text(ascend ? "Colour \(Image(systemName: "arrowtriangle.down"))" : "Colour \(Image(systemName: "arrowtriangle.up"))")
                    }
                .buttonStyle(.bordered)
                .padding(.leading)
                .frame(width: 110.0,height: 20.0, alignment: .leading)
                .font(.subheadline)
                
                Spacer()
                    .frame(width: 5.0)
                Text("Value")
                Divider()
                    .frame(height: 20.0)
                Text("Resistance")
                Divider()
                    .frame(height: 20.0)
                Text("Tolenrance")
                Divider()
                    .frame(height: 20.0)
                Text("TCR")
                    .padding(.trailing)
                    .frame(height: 20.0)
            }
            .font(.subheadline)
            .foregroundColor(Color("AccentColor"))

            List(searchText == "" ? colors : updatedColors) { ColorType in
                HStack(spacing: 10) {
                    Spacer()
                        .frame(width: 20.0)
                    HStack () {
                        Text("\(ColorType.name)")
                        Spacer()
                    }
                        .frame(width: 90.0)
                    Text("\(ColorType.value)")
                        .frame(width: 40.0)
                    
                    Divider()
                    Text("\((ColorType.resistance))")
                        .frame(width: 74.0)
                    
                    Divider()
                    Text("\((ColorType.tolerance))")
                        .frame(width: 73.0)
                    
                    Divider()
                    HStack () {
                        Text("\((ColorType.TCR))")
                    }
                    .frame(width: 27.0)
                    
                    HStack {
                        Spacer()
                    }
                    
                }
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .listRowBackground(changeColorSheet(input: "\(ColorType.name)"))
                .foregroundColor(changeFontColorSheet(input: "\(ColorType.name)"))
                .contextMenu {
                    Button {
                        UIPasteboard.general.setValue(ColorType.value, forPasteboardType: "public.plain-text")
                    } label: {
                        Label("Copy Value", systemImage: "doc.on.doc")
                    }
                    Button {
                        UIPasteboard.general.setValue(ColorType.resistance, forPasteboardType: "public.plain-text")
                    } label: {
                        Label("Copy Resistance", systemImage: "doc.on.doc")
                    }
                    Button {
                        UIPasteboard.general.setValue(ColorType.tolerance, forPasteboardType: "public.plain-text")
                    } label: {
                        Label("Copy Tolerance", systemImage: "doc.on.doc")
                    }
                    Button {
                        UIPasteboard.general.setValue(ColorType.TCR, forPasteboardType: "public.plain-text")
                    } label: {
                        Label("Copy Temperature Coefficient", systemImage: "doc.on.doc")
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Colour Table")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    dismiss()
                }label:{
                    Label("",systemImage:"xmark.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(Color("AccentColor"))
                        .font(.title2)
                }
            }
                            }
            .searchable(text: $searchText, prompt: "Search Colour")
            .onChange(of: searchText) { searchValue in
                    updatedColors = colors.filter { $0.name.contains(searchValue)}
            }
        }
    }
}


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
