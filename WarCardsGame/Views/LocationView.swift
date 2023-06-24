import SwiftUI

struct LocationView: View {
    @EnvironmentObject var geoManager : LocationManager
    @ObservedObject var viewModel: SignInModel

    var body: some View {
        VStack{
            NavigationView{
                VStack (alignment: .center){
                    //Header
                    Text(viewModel.title)
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                        .padding(.bottom, 10)
                        .onAppear{
                            viewModel.validateLandmarks(latitude: (geoManager.location?.coordinate.latitude ?? 0.0), longitude: (geoManager.location?.coordinate.longitude ?? 0.0))
                        }

                    //Location + Image
                    if viewModel.displayLocation{

                        Text("Location: [\(geoManager.location?.coordinate.latitude ?? 0.0),\(geoManager.location?.coordinate.longitude ?? 0.0)]")
                            .frame(maxWidth: .infinity)

                        HStack{
                            if viewModel.isWestern{
                                Image("West")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .alignmentGuide(.leading) { _ in
                                        0 // Aligns the image to the right within its container
                                    }
                                Spacer()
                            }else{
                                Spacer()
                                Image("East")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .alignmentGuide(.trailing) { _ in
                                        0 // Aligns the image to the right within its container
                                    }
                            }
                        }
                    }

                    //Button
                    Button {
                        viewModel.initiatePlay()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.red)
                                .frame(width: 200, height: 75)
                            Text("Start Play")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }.padding()

                    NavigationLink(destination:GameView(isWestern: viewModel.isWestern, playerName: viewModel.playerName) ,isActive: $viewModel.isReadyToStart){}.hidden()

                }.padding()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }
        }
    }
    }
