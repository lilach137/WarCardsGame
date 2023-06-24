import SwiftUI

struct signInView: View {
    @ObservedObject var viewModel: SignInModel

    var body: some View {
        NavigationView{
            VStack{
                VStack {
                    //Header
                    Text(viewModel.title)
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                }.padding(.top, 30)

                //Name Form
                Form{
                    if !viewModel.errorMsg.isEmpty{
                        Text(viewModel.errorMsg)
                            .foregroundColor(Color.white)
                    }
                    TextField("Enter Your Name",text: $viewModel.playerName)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                //Button
                Button {
                    viewModel.setPlayerName()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius:2)
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 30)
                        Text("SUBMIT")
                            .foregroundColor(Color.red)
                            .bold()
                        
                    }
                }.padding()
                
                Spacer()

                NavigationLink(destination: LocationView(viewModel: viewModel),isActive: $viewModel.isNavigationActive){}.hidden()

            }
        }
    }
}
