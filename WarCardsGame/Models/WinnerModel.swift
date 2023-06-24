import Foundation

class WinnerModel: ObservableObject{
    @Published var winnerLabel: String = ""
    @Published var result : String = ""
    @Published var back = false

    init(winnerName: String, score: Int)
    {
        winnerLabel = "The winner is " + winnerName + "!"
        result = "Score : \(score)"
    }
    
    func returnToMenu(){
        back = true
    }

}
