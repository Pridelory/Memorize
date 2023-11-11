//
//  ContentView.swift
//  Memorize
//
//  Created by 王蒙 on 13/09/2023.
//

//import SwiftUI
//
//struct MemoryDemoFirstVersionView: View {
//    let emojis: Array<String> = ["👻", "🎃", "😈", "💀", "👻", "🎃", "😈", "💀"]
//
//    @State var cardCount = 3
//
//    var body: some View {
//        VStack {
//            // 此种大括号初始化方式为trailing closure 尾随闭包，所以可以直接用大括号
//            ScrollView {
//                cards
//            }
//            Spacer()
//            cardCountAdjusters
//        }
//        .padding()
//    }
//
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//    }
//
//    var cards: some View {
//        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
//            ForEach(0..<cardCount, id: \.self) { index in
//                CardView(content: emojis[index])
//                    .aspectRatio(2/3, contentMode: .fit)
//            }
//        }
//        .foregroundColor(.orange)
//    }
//
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        // 以下为闭包写法
//        Button {
//            cardCount += offset
//        } label: {
//            Image(systemName: symbol)
//        }
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//            .imageScale(.large)
//    }
//
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//            .imageScale(.large)
//    }
//}
//
//struct CardView: View {
//    let content: String
//    @State var isFaceUp = true
//
//    var body: some View {
//        // an important case using the closure
//        ZStack() {
//            // type inference
//            let base = RoundedRectangle(cornerRadius: 12)
//            Group {
//                base.fill(.white)
//                base.strokeBorder(lineWidth: 2)
//                Text(content).font(.largeTitle)
//            }
//            .opacity(isFaceUp ? 1 : 0)
//            base.fill().opacity(isFaceUp ? 0 : 1)
//        }
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MemoryDemoFirstVersionView()
//        }
//    }
//}
