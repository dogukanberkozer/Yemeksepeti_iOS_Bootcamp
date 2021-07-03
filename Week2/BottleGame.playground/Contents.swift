import UIKit

struct Cannon {
    var ejectionAngle: Double, throwSpeed: Double, g = 10 // the cannon has throwing angle and speed parameters
    
    init (teta: Double, V: Double) {
        self.ejectionAngle = fixAngle(angle: teta)
        self.throwSpeed = fixSpeed(speed: V)
    }
    
    func calculateRange() -> Double { // R = V * V * sin(2 * teta) / g
        return (self.throwSpeed * self.throwSpeed * sin(2 * self.ejectionAngle * Double.pi / 180) / Double(g))
    }
}

struct Bottle {
    var location: Double, platingRange: Double, isTurndown: Bool // the bottle has distance from cannon, delta(plating range) and situation
    
    init (d: Double, delta: Double) {
        self.location = fixLocation(position: d)
        self.platingRange = fixDelta(delta: delta)
        self.isTurndown = false
    }
}

struct Player { // the player has nickname and score variables
    var nickname: String, score: Int
    
    init (nick: String) {
        self.nickname = nick
        self.score = 0
    }
}

struct Game { // the game has cannon, bottle and player structes
    var cannon: Cannon, bottle: Bottle, player: Player
    
    init (cannon: Cannon = Cannon(teta: -1, V: -1), bottle: Bottle = Bottle(d: -1, delta: -1), player: Player = Player(nick: "nil")) {
        self.cannon = cannon
        self.bottle = bottle
        self.player = player
    }
}

let cannon = Cannon(teta: 45, V: 70)
let bottle = Bottle(d: 1050, delta: 0.7)
let player = Player(nick: "dou")
var game = Game(cannon: cannon, bottle: bottle, player: player)
// calculation of the cannon shoot
if(cannon.calculateRange() >= (bottle.location - bottle.platingRange) && cannon.calculateRange() <= (bottle.location + bottle.platingRange)) {
    print("The target has been hit 🎯")
    game.bottle.isTurndown = true
    game.player.score += 1
}else {
    print("The target has been missed 😢, try again ♻️")
}

func fixAngle (angle: Double) -> Double {  // throwing angle must between 0.0 and 90.0
    if(angle < 0){
        return 0.0
    }else if(angle > 90){
        return 90.0
    }else{
        return angle
    }
}

func fixSpeed (speed: Double) -> Double { // throwing speed must between 0.0 and 100.0
    if(speed < 0){
        return 0.0
    }else if(speed > 100){
        return 100.0
    }else{
        return speed
    }
}

func fixLocation (position: Double) -> Double { // location must between 0.0 and 1500.0
    if(position < 0){
        return 0.0
    }else if(position > 1500){
        return 1500.0
    }else{
        return position
    }
}

func fixDelta (delta: Double) -> Double { // delta must between 0.1 and 1.0
    if(delta < 0.1){
        return 0.1
    }else if(delta > 1){
        return 1.0
    }else{
        return delta
    }
}
