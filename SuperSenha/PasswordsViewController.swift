//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by EPR Exatron on 06/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var userNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: userNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
        
        }
        
        func generatePasswords() {
            tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
            tvPasswords.text = ""
            let passwords = passwordGenerator.generate(total: numberOfPasswords)
            for password in passwords {
                tvPasswords.text.append(password + "\n\n")
        }

    }

    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
    
}
