import Foundation

class PlayModel : ObservableObject{
    @Published var allPlayerScores = 0
    @Published var homeScore = 0
    @Published var matchCount :Int = 0
    @Published var isGameOver = false
    @Published var playerName :String = ""
    @Published var isPlayerWest = false
    @Published var computerAlignment = ""
    @Published var totalMatches = 0
    @Published var playerCard: Card
    @Published var houseCard: Card
    @Published var gameWinner :String = ""
    @Published var gameWinnerScore = 0
    @Published var cardBack = Card(image: "cardBack", value:-1)
    
    @Published var cards = [Card(image:"11",value:11)
                           ,Card(image:"10",value:10)
                           ,Card(image:"9" , value :9 )
                           ,Card(image :"8" , value:8)
                           ,Card(image: "7",value:7)
                           ,Card(image: "6", value:6)
                            ,Card(image:"5",value:5)
                            ,Card(image:"4",value:4)
                            ,Card(image:"3",value:3)
                            ,Card(image:"2",value:2)
                            ,Card(image:"1" , value:1)]
                           
    

    init(isWestern: Bool, name: String) {
        playerName = name
        allPlayerScores = 0
        isPlayerWest = isWestern
        let cardBack1 = Card(image: "cardBack", value:-1);
        playerCard = cardBack1
        houseCard = cardBack1
        isGameOver = false
        matchCount = 0
        homeScore = 0
        startTimer()
    }
    


     func  openRandomCard() -> Card {
         let pos = Int.random(in: 0...10)
         return cards[pos]
     
      }
    
    func assignRandomCardToPlayer() {
        playerCard =  self.openRandomCard()
        houseCard = self.openRandomCard()
        
    }

    
    func assignBacksideCards() {
        playerCard = self.cardBack
        houseCard = self.cardBack
    }
    
    private func startTimer() {
       var timeCounter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            if timeCounter % 3 == 0 {
                self?.assignBacksideCards()
              
            }
            
            if timeCounter % 5 == 0 {
                timeCounter = 0
                self?.matchCount += 1
   
                self?.assignRandomCardToPlayer()
                self?.revealCards()

            }
            
            if self?.matchCount == 10 {
                self?.terminateMatch()
                timer.invalidate()
            }
            
            timeCounter += 1
        }
    }
    
    private func revealCards() {
        
        if playerCard.value > houseCard.value {
            allPlayerScores += 1
        } else if playerCard.value < houseCard.value {
            homeScore += 1
        } else if playerCard.value == houseCard.value {
            homeScore += 1
            allPlayerScores += 1        }
        }
    
    private func terminateMatch() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            self?.identifyWinner()
            self?.isGameOver = true
            timer.invalidate()
        }
    }
    
    private func identifyWinner() {
        if allPlayerScores > homeScore {
            gameWinner = playerName
            gameWinnerScore = allPlayerScores
        }else {
            gameWinner = "Computer"
            gameWinnerScore = homeScore
        }
    }
    
}

