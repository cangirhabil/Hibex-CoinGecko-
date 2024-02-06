//
//  CoinRowView.swift
//  Hibex
//
//  Created by HCangir on 6.02.2024.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingColumns: Bool
    @State private var priceChangeColor: Color = .theme.gray
    
    
    var body: some View {
        HStack(spacing: 0, content: {

            leftColumn
            Spacer()
            if(showHoldingColumns){
                centerColumn
            }
            rightColumn
            
        })
    }
}

struct CoinRowView_Previews: PreviewProvider{
    static var previews: some View{
        Group{
            
            CoinRowView(coin: dev.coin, showHoldingColumns: true)
            
            
            CoinRowView(coin: dev.coin, showHoldingColumns: true)
                .preferredColorScheme(.dark)
        }
        
    }
}

extension CoinRowView{
    
    private var leftColumn: some View {
        HStack(spacing: 0, content: {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        })
    }
    
    
    private var  centerColumn: some View{
        VStack(alignment: .trailing, content: {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        })
        .foregroundStyle(Color.theme.accent)
    }
    
    
    private var rightColumn: some View{
        VStack(alignment: .trailing, content: {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "0")
                         .bold()
                         .onAppear {
                             if let priceChangePercentage = coin.priceChangePercentage24H {
                                 if priceChangePercentage < 0 {
                                     self.priceChangeColor = .theme.red
                                 } else if priceChangePercentage > 0 {
                                     self.priceChangeColor = .theme.green
                                 } else {
                                     self.priceChangeColor = .theme.gray
                                 }
                             } else {
                                 self.priceChangeColor = .theme.gray
                             }
                         }
                         .foregroundStyle(priceChangeColor)
            
        })
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
