import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: PlayModel

    init(isWestern: Bool, playerName: String) {
        _viewModel = StateObject(wrappedValue: PlayModel(isWestern: isWestern, name: playerName))
    }
    
    var body: some View {
        ZStack{
            Image("tableGame")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    if viewModel.isPlayerWest {
                        VStack{
                            Text(viewModel.playerName)
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.allPlayerScores)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                        Image("icon")
                        Spacer()
                        VStack{
                            Text("Computer")
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.homeScore)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    } else {
                        VStack{
                            Text("Computer")
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.homeScore)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    
                        VStack{
                            Text(viewModel.playerName)
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.allPlayerScores)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    }
                    
                }.foregroundColor(.white)
                
                HStack{
                    Spacer()
                    Image(viewModel.playerCard.image).resizable().frame(width: 150, height: 250)
                    Spacer()

                    Spacer()
                    Image(viewModel.houseCard.image).resizable().frame(width: 150, height: 250)
                    Spacer()
                }
                Spacer()
            }
            
            NavigationLink(destination: ScoreView(champion: viewModel.gameWinner, finalScore: viewModel.gameWinnerScore), isActive: $viewModel.isGameOver){}.hidden()
        }
    }
}
