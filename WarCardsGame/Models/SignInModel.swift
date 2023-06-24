
import Foundation

class SignInModel: ObservableObject{
    @Published var middle = 34.817549168324334

    @Published var playerName : String = ""
    @Published var title : String = "Hello "
    @Published var errorMsg = ""
    @Published var isNavigationActive = false
    @Published var displayLocation = false
    @Published var isWestern = false
    @Published var isReadyToStart = false
    
    init(){
        
    }
    
    func setPlayerName(){
        guard !playerName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please Fill Your Name"
            return
        }
        title = "Hello " + playerName
        isNavigationActive = true
    }
    
    func validateLandmarks(latitude: Double, longitude: Double){
        if longitude < middle{
            isWestern = true
        }else{
            isWestern = false
        }
        displayLocation = true
    }
    
    func initiatePlay(){
        isReadyToStart = true
    }
    
}
