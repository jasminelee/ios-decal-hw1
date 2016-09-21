//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit

//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: Yes, they are both optionals. However, the instance variables are implicitly unwrapped optionals.


//: ## Q2: Variable Types and Function Types
    
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reversed())}
        let numWords = words.count
        
        for i in 0..<numWords {
            let original = words[i]
            let reversedCopy = reversedWords[i]

            for index in original.characters.indices {
                if original[index] != reversedCopy[index] {
                    return false
                }
            }
        }
        return true
    }
    

//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.

//: The issue with this function was that it wasn't logically correct. It wasn't actually checking each character in each string to see if the input list was a palindrome. Additionally, I had to change the modifer from instance to class method.


//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters : [Character : Int] = [Character :Int]() //Line X
        let lenA = self.wordA.characters.count
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: The issue with the original countLetters code was that it was declared but never initialized. Another problem with this function was that it was originally a class method; I changed it to become an instance method. Furthermore, I changed lenA and lenB to become immutable, but only bc the IDE told me to.
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(words: ["hih", "racecar", "mom", "wow"])
Words.arePalindromes(words: ["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
