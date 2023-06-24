import SwiftUI

struct ScoreView: View {
    @StateObject private var viewModel: WinnerModel

    init(champion: String, finalScore :Int){
        _viewModel = StateObject(wrappedValue: WinnerModel(winnerName:champion, score: finalScore))
    }

    var body: some View {
        VStack{
            VStack {
                //Header
                Text(viewModel.winnerLabel)
                    .font(.system(size: 30))
                    .foregroundColor(Color.red)
                    .bold()


                Text(viewModel.result)
                    .font(.system(size: 30))
                    .foregroundColor(Color.red)
                    .bold()

                Button {
                    viewModel.returnToMenu()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.red)
                            .frame(width: 125, height: 50)
                        Text("Back To Menu")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }.padding()

            }.padding(.top, 30)

            NavigationLink(destination: LocationView(viewModel: SignInModel()),isActive: $viewModel.back){}.hidden()
        }
    }
}
