//
//  ScrollViewReaderBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Philophobic on 28/12/24.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldString : String = ""
    @State var scrollToIndex  : Int = 0
    var body: some View {
        VStack {
            
            TextField("Scroll To Index", text: $textFieldString)
                .frame(height: 55)
                .padding(.leading,5)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Go to index no \(textFieldString)") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldString) {
                        scrollToIndex = index
                    }
                }
            }
            ScrollView {
                
                ScrollViewReader { proxy in
                    ForEach(0..<50) { value in
                        Text("The Index is # \(value)")
                            .font(.title)
                            .frame(height:150)
                            .frame(maxWidth:.infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(value)
                    }
                    .onChange(of: scrollToIndex) { _, newValue in
                        proxy.scrollTo(newValue, anchor: .bottom)
                    }
                }

            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
