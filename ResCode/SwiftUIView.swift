import SwiftUI

struct SwiftUIView: View {
    @State private var midY: CGFloat = 0.0
    @State private var headerText = "Contacts"
    var body: some View {
        NavigationView {
            List {
                HStack {
                    //text
                    HeaderView(headerText: self.headerText, midY: $midY)
                        .frame(height: 40, alignment: .leading)
                        .padding(.top, 5)
                        .offset(x: -45)

                    HStack {
                        //button 1
                        Button(action: {
                            self.action1()
                        }) {
                            Image(systemName: "ellipsis.circle")
                                .font(.largeTitle)
                        }

                        //button 2
                        Button(action: {
                            self.action2()
                        }) {
                            Image(systemName: "pencil.circle")
                                .font(.largeTitle)
                        }
                    }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 16))
                    .foregroundColor(.blue)

                } .frame(height: 40, alignment: .leading)
                    .opacity(self.midY < 70 ? 0.0 : 1.0)
                    .frame(alignment: .bottom)

                ForEach(0..<100){ count in
                    Text("Row \(count)")
                }

            }
            .navigationBarTitle(self.midY < 70 ? Text(self.headerText) : Text(""), displayMode: .inline)
            .navigationBarItems(trailing: self.midY < 70 ? HStack {
                //button 1
                Button(action: {
                    self.action1()
                }) {
                    Image(systemName: "ellipsis.circle")
                    .frame(width: 20, height: 20)
                }

                //button 2
                Button(action: {
                    self.action2()
                }) {
                    Image(systemName: "pencil.circle")
                    .frame(width: 20, height: 20)
                }
            }
            :
                HStack {
                    //button 1
                    Button(action: {
                        self.action1()
                    }) {
                        Image(systemName: "ellipsis.circle")
                        .frame(width: 0, height: 0)
                    }

                    //button 2
                    Button(action: {
                        self.action2()
                    }) {
                        Image(systemName: "pencil.circle")
                        .frame(width: 0, height: 0)

                    }
                }
            )
        }
    }

    func action1() {
        print("do action 1...")
    }

    func action2() {
        print("do action 2...")
    }
}

struct HeaderView: View {
    let headerText: String
    @Binding var midY: CGFloat
    var body: some View {
        GeometryReader { geometry -> Text in
            let frame = geometry.frame(in: CoordinateSpace.global)

            withAnimation(.easeIn(duration: 0.25)) {
                DispatchQueue.main.async {
                   self.midY = frame.midY
                }
            }

            return Text(self.headerText)
                .bold()
                .font(.largeTitle)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
