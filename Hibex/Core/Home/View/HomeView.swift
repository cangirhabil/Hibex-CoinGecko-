//
//  HomeView.swift
//  Hibex
//
//  Created by admin on 2.11.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio:Bool = false
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                
                columnTitles
                
                if(!showPortfolio){
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                
                if(showPortfolio){
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
    }
}

extension HomeView{
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background {
                    CircleButtonAnimationView(animate: $showPortfolio)
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
            
        }
    }
}


extension HomeView{
    private var allCoinsList: some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumns: false)
                    .listRowInsets(.init(top: 0, leading: 5, bottom: 0, trailing: 17))
            }
        }
        .listStyle(PlainListStyle())
    }
}
extension HomeView{
    private var portfolioCoinsList: some View{
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumns: true)
                    .listRowInsets(.init(top: 0, leading: 5, bottom: 0, trailing: 17))
            }
        }
        .listStyle(PlainListStyle())
    }
}
extension HomeView{
    private var columnTitles: some View{
        HStack{
            Text("coin")
            Spacer()
            if(showPortfolio){
                Text("holding")
            }
            Text("price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}


struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView(content: {
            HomeView()
                .navigationBarBackButtonHidden(true)
        })
        .environmentObject(dev.homeVM)
    }
}

