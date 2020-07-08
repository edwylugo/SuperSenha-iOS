//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by EPR Exatron on 06/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import Foundation

// Lógica do gerador de Senhas

class PasswordGenerator {
    
    //Variaveis
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    //Conjunto de senhas
    var passwords: [String] = []
    
    //Constantes
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=˜‘|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    
    //Método construtor
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        //limita o numero de caracteres entre 1 e 16
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.useSpecialCharacters = useSpecialCharacters
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.numberOfCharacters = numberOfCharacters
        
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array (universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
        
    }
    
    
    
    
    
}
