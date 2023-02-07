//
//  DecoderView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-12-09.
//

import SwiftUI
import Resistance
import SegmentedPicker

let items: [String] = ["4 Bands", "5 Bands", "6 Bands"]
let fourbandnum: [String] = ["1","2","3","4"]
let fivebandnum: [String] = ["1","2","3","4","5"]
let sixbandnum: [String] = ["1","2","3","4","5","6"]

struct DecoderView: View {
    
    // Selection variables
    @State var selectedIndex: Int = 0
    @State private var tabSelection: Int = 0
    @State var selection: String = "Black"
    @State var BandSelection: String = "1"
    
    // State variables
    @State private var showingSheet: Bool = false
    @State private var action: Bool = false
    @State private var showSheet: SheetView? = nil

    // Animation variables
    @State private var animationAmount: Double = 1.0
    @State var scale: Double = 1.0    

    // Resistor parameters
    @State var digit1: Digit = .white
    @State var digit2: Digit = .white
    @State var digit3: Digit = .white
    @State var multiplier: Multiplier = .white
    @State var tolerance: Tolerance = .brown
    @State var coefficient: Coefficient = .brown

    // Display variables
    @State var resistorValue: String = "90"
    @State var resistorTolerance: String = "2"
    @State var resistorTolerancePercentage: String = "5"
    @State var temperatureCoefficient: String = "10"
    
    // Apperance variant
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationStack {
            VStack {
                /* SegmentedPicker to switch between different types of bands */
                SegmentedPicker("Select number of bands", items: items, selection:$selectedIndex)
                    .padding(.horizontal)
                // .frame(width:UIScreen.main.bounds.width * 0.95)
                
                // Resistor model view for displaying band colours
                ResistorView(selectedIndex: $selectedIndex, digit1: $digit1, digit2: $digit2, digit3: $digit3, multiplier: $multiplier, tolerance: $tolerance, coefficient: coefficient)

                TabView (selection: $tabSelection){
                //First page for displaying values
                    LazyVStack {
                        HStack {
                            ResistanceTile()
                            Spacer()
                                .frame(width: 20)
                            ToleranceTile()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                        CoefficientTile()
                    }
                    .tag(0)
                    LazyVStack {
                //Second page for picking colours and bands
                        PickerTile(Selection: $selection, tabSelection: $tabSelection, bandSelection: $BandSelection, selectedIndex: $selectedIndex, digit1: $digit1, digit2: $digit2, digit3: $digit3, multiplier: $multiplier, tolerance: $tolerance, coefficient: coefficient)
                    }
                    .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .onAppear {
                setupAppearance()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Menu options
                    Menu {
                        Button(role: .destructive, action: {
                        }) {
                            Label("Reset Parameters", systemImage: "arrow.counterclockwise")
                        }
                        Button(action: {
                        }) {
                            Label("Send Feedback", systemImage: "exclamationmark.bubble")
                                .foregroundColor(.purple)
                        }
                        ShareLink(item: URL(string: url)!) {
                            Label("Share App", systemImage: "square.and.arrow.up")
                        }
                        Button(action: {
                            showingSheet.toggle()
                        }) {
                            Label("Colour Table", systemImage: "plus")
                        }
                        .sheet(isPresented: $showingSheet) {
                            NavigationStack {
                                SheetView()
                            }
                            .presentationDetents([.large])
                            .presentationDragIndicator(.visible)
                        }

                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color("AccentColor"))
                            .font(.title2)
                    }
                }
            }
            .padding(.bottom)
            .navigationTitle("Decoder")
            
        }
    }
    func setupAppearance() {
        if colorScheme == .dark {
            UIPageControl.appearance().currentPageIndicatorTintColor = .white
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.2)
        } else {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    }
}

struct DecoderView_Previews: PreviewProvider {
    static var previews: some View {
        DecoderView()
    }
}

struct ResistorView: View {
    
    @Binding var selectedIndex: Int
    @Binding var digit1: Digit
    @Binding var digit2: Digit
    @Binding var digit3: Digit
    @Binding var multiplier: Multiplier
    @Binding var tolerance: Tolerance
    @State var coefficient: Coefficient 

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 15)
                .foregroundColor(.secondary)
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(Color("ResistorColor"))
                .shadow(color: Color("ResistorColor"), radius: 5)
                .padding()
            
            HStack(spacing: 20) {
                switch selectedIndex {
                case 1:
                    Spacer()
                    //1st band
                    Rectangle()
                        .fill(changeColor(input: digit1))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 35, height: 150)
                    //2nd band
                    Rectangle()
                        .fill(changeColor(input: digit2))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 35, height: 150)
                    //3rd band
                    Rectangle()
                        .fill(changeColor(input: digit3))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 35, height: 150)
                    //4th band
                    Rectangle()
                        .fill(changeColor(input: multiplier))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 35, height: 150)
                    Spacer()
                    //5th band
                    Rectangle()
                        .fill(changeColor(input: tolerance))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 35, height: 150)
                    Spacer()
                case 2:
                    Spacer()
                    //1st band
                    Rectangle()
                        .fill(changeColor(input: digit1))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 30, height: 150)
                    //2nd band
                    Rectangle()
                        .fill(changeColor(input: digit2))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 30, height: 150)
                    //3rd band
                    Rectangle()
                        .fill(changeColor(input: digit3))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 30, height: 150)
                    //4th band
                    Rectangle()
                        .fill(changeColor(input: multiplier))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 30, height: 150)
                    Spacer()
                    //5th band
                    Rectangle()
                        .fill(changeColor(input: tolerance))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 30, height: 150)
                    //6th band
                    Rectangle()
                        .fill(changeColor(input: coefficient))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 30, height: 150)
                    Spacer()
                default:
                    Spacer()
                    //1st band
                    Rectangle()
                        .fill(changeColor(input: digit1))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 40, height: 150)
                    //2nd band
                    Rectangle()
                        .fill(changeColor(input: digit2))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 40, height: 150)
                    //3rd band
                    Rectangle()
                        .fill(changeColor(input: digit3))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 40, height: 150)
                    Spacer()
                    //4th band
                    Rectangle()
                        .fill(changeColor(input: multiplier))
                        .foregroundColor(.white).opacity(0.9)
                        .frame(width: 40, height: 150)
                    Spacer()
                }
            }
        }
    }
}

struct ResistanceTile: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("RTColor"))
            VStack {
                HStack {
                    Text("Resistance")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text1"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.all)
                
                Spacer()
                
                HStack {
                    Image(systemName: "equal")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text1"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 1)
                
                HStack {
                    Text("430Ω")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text1"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .contextMenu {
            Button {
                UIPasteboard.general.setValue(0, forPasteboardType: "public.plain-text")
            } label: {
                Label("Copy Resistance", systemImage: "doc.on.doc")
            }
        }
    }
}

struct ToleranceTile: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("TTColor"))
            VStack {
                HStack {
                    Text("Tolerance")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text2"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.all)
                
                Spacer()
                
                HStack {
                    Image(systemName: "plusminus")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text2"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 1)
                
                HStack {
                    Text("5%")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text2"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .contextMenu {
            Button {
                UIPasteboard.general.setValue(0, forPasteboardType: "public.plain-text")
            } label: {
                Label("Copy Tolerance", systemImage: "doc.on.doc")
            }
        }
    }
}

struct CoefficientTile: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("TCTColor"))
            
            VStack {
                HStack {
                    Text("Temperature Coefficient")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text3"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.all)
                
                Spacer()
                
                HStack {
                    Image(systemName: "thermometer.medium")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text3"))
                        .padding(.top, 5)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 1)
                
                HStack {
                    Text("220 ppm/K")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text3"))
                        .padding(.top, 1)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .contextMenu {
            Button {
                UIPasteboard.general.setValue(0, forPasteboardType: "public.plain-text")
            } label: {
                Label("Copy Temperature Coefficient", systemImage: "doc.on.doc")
            }
        }
        .frame(height: 181)
        .padding(.horizontal)
    }
}

struct PickerTile: View {
    
    @Binding var Selection: String
    @Binding var tabSelection: Int
    @Binding var bandSelection: String
    @Binding var selectedIndex: Int
    
    @Binding var digit1: Digit
    @Binding var digit2: Digit
    @Binding var digit3: Digit
    @Binding var multiplier: Multiplier
    @Binding var tolerance: Tolerance
    @State var coefficient: Coefficient
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.secondarySystemBackground))
                VStack {
                    HStack{
                        Text("Select Band and Colour")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.primary)
                        
                        Spacer()
                        Button("Done") {
                            withAnimation(){
                                tabSelection = 0
                            }
                        }
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                    .padding(.horizontal,10)
                    HStack{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 5){
                            ForEach(checkBandNum(selectedIndex: selectedIndex), id: \.self) {num in
                                ZStack{
                                    Circle()
                                        .fill(Color("ResistorColor"))
                                        .frame(width: 45,height: 45)
                                        .onTapGesture {
                                            bandSelection = num
                                        }
                                        .padding(2)
                                    if bandSelection == num {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            Circle()
                                                .stroke(Color("ResistorColor").opacity(0.4), lineWidth: 10)
                                                .frame(width: 50, height: 50)
                                        }
                                    }
                                    Text(num)
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        Spacer()
                    }
                    ZStack{
//                        ColorSwatchView(selection: $Selection)
//                            .background(
//                                Material.ultraThin,
//                               in: RoundedRectangle(cornerRadius: 20, style: .continuous)
//                            )
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .padding()
            }
            .frame(height: 384)
            .padding(.horizontal)
        }
    }
}

// Return bandnum array based on selected index
func checkBandNum(selectedIndex: Int) -> [String] {
    switch selectedIndex {
    case 0:
        return fourbandnum
    case 1:
        return fivebandnum
    case 2:
        return sixbandnum
    default:
        return fourbandnum
    }
}

