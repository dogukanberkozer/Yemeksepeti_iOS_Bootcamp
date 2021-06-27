import UIKit

// 1st Question
var resultString = "aaba kouq bux ", myString = resultString, counter = 0 // required variables
print(removeCharacters(myString: myString, count: 2))

func removeCharacters(myString: String, count: Int) -> String {
    for char1 in myString{
        counter = 0
        for char2 in myString{
            if char1 == char2 { // when control character is the same with index character
                counter += 1 // increases counter of the character
            }
        }
        if(counter >= count && char1 != " "){ // must keep the whitespaces
            resultString = resultString.replacingOccurrences(of: String(char1), with: "") // removing the character from all string
        }
    }
    return resultString
}


// 2nd Question
var string = "merhaba nasılsınız ? iyiyim siz nasılsınız ? ben de iyiyim".replacingOccurrences(of: " ? ", with: " ").lowercased(), wordCounter:[String: Int] = [:]
// removed "?" and get lowercased to check more efficient
for word in string.split(separator: " ") { // split by whitespace (" ")
    wordCounter["\(word)", default:0] += 1 // increses of the word counter
}

print(wordCounter)
