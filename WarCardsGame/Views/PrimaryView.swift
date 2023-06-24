import SwiftUI

struct PrimaryView: View {
    @EnvironmentObject var locationManager : LocationManager
    @StateObject var viewModel = SignInModel()
   
    var body: some View {
        if !viewModel.isNavigationActive{
            signInView(viewModel: viewModel)
        }  else{
            LocationView(viewModel: viewModel).environmentObject(locationManager)
        }   }
}

struct PrimartView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView().environmentObject(LocationManager())
    }
}

