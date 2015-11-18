//
//  ViewController.swift
//  Toor
//
//  Created by Charlie Maréchal on 20/10/15.
//  Copyright © 2015 Skruyu Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //Status bar in white
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    
    @IBOutlet weak var affiche: UILabel! // Affichage du résultat
    @IBOutlet weak var yeux: UIImageView! // Visage

    
    var hasBeenPressed: Bool = false //if coma has been pressed
    var afficheTemp = "" // Temp var for display
    var result = Double() // Contains result of calcul
    var currentNumber = Double() // Contains number input
    var compteur = 1 //Prevent too many numbers to be entered and crashing the app
    var currentOperator = String() // Current operator
    var egalHasBeenPRessed = false // Check if equal has been pressed
    var resultTemp = 0.0 // Temp result to continue calcul
    var divisionVirgule = 10.0 // To add numbers after coma
    func random() -> Int {
   
        let aleatoire =  Int(arc4random_uniform(UInt32(commDico.count)))
        return(aleatoire)
   
    }
    var compteurDeux = 0
    var tips = 0
    var arrayImages:[String] = []

    
    
    /* Comments and dictionary***********************************************************/
    
    @IBOutlet weak var commentaires: UILabel! // Toor comments
    
    var commDico = ["Feed me numbers, human.", // Toor sentences dictionnary
                    "Oh, yeah, that's good",
                    "Give me 9. I love 9's.",
                    "Answer is 42. But what's the question?",
                    "5 floats Max por favor."
    ]
    
    
    
    /* Initialize informations at opening*************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentOperator = "=" // Initial operator
        affiche.text = "Gimme.Gimme.Gimme." // Initial text
        commentaires.text = commDico[0] // Initial comment
        
       yeux.image = UIImage(named: "yeux")
        
        
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**** Numbers buttons *******************************************************/
    
    @IBAction func tips(sender: UIStepper) {
        pourboire.text = String(tips.value)
       tips += 5
        affiche.text = String(tips)
    }
    @IBOutlet weak var pourboire: UILabel!
    
    @IBAction func buttonSender(sender: UIButton) {
        
        
        if hasBeenPressed == true {
            
            
            if compteurDeux == 11 {
                
                let maximum = currentNumber
                commentaires.text! = "Calm down, cowboy."
                currentNumber = maximum
                affiche.text = String(Double(currentNumber))
                
            } else {

                currentNumber = currentNumber + Double(sender.titleLabel!.text!)! / divisionVirgule
                affiche.text = String(Double(currentNumber))
                compteur++
                compteurDeux++
                divisionVirgule *= 10.0
            
                if compteur == 10 {
                    commentaires.text = self.commDico[random()]
                    compteur = 0
                }}
            
            
        } else {
         
        
            if compteurDeux == 11 {
                
                let maximum = currentNumber
                commentaires.text! = "Calm down, cowboy."
                currentNumber = maximum
                affiche.text = String(Int(currentNumber))
                
            } else {
                currentNumber = currentNumber*10 + Double(sender.titleLabel!.text!)!
                affiche.text = String(Int(currentNumber))
                compteur++
                compteurDeux++
            }
            
            if compteur == 10 {
                commentaires.text = self.commDico[random()]
                compteur = 0
            }
            
           
        
            
        }}

    
    
    /**** Operations buttons ****************************************************************/
    
    
    
    @IBOutlet weak var buttonColor: UIButton!
    
    @IBAction func foislache(sender: UIButton) {
        buttonColor.backgroundColor = UIColor.redColor()

    }
  
    
    @IBAction func egalTempButton(sender: UIButton) {

        egalHasBeenPRessed = true // check if equal has been pressed
        resultTemp = result // place le résultat en mémoire
    
    }
    
    @IBAction func operationes(sender: UIButton) {
        
        divisionVirgule = 10
        
        if currentNumber.isInfinite || currentNumber.isNaN {
        affiche.text = "Autodestruction."
        }
        
        if egalHasBeenPRessed == true {
            
            affiche.text = String(resultTemp)
            
            switch currentOperator{
                
            case "=": result = currentNumber
            case "+": result = result + currentNumber
            case "-": result = result - currentNumber
            case "/": result = result / currentNumber
            case "*": result = result * currentNumber
            case "15%": result = result * 0.15
            case "18%": result = result * 0.18
            case "20%": result = result * 0.20
            default: print("Error")
            }
            
            
            if result - Double(Int(currentNumber.isFinite)) == 0.0  {
                affiche.text = String(Int(result.isFinite))
                
            } else if result.isInfinite || result.isNaN  == true {
                
                affiche.text = "Autodestruction."
                
            } else if result - Double(Int(result)) == 0.0 {
                affiche.text = String(Int(result))
                
            } else {
                
                /*if result - Double(Int(result)) < 0.001 {
                    
                    affiche.text = String(format: "%.3f", result)
                    
                } else if result - Double(Int(result)) < 0.01 && result - Double(Int(result)) > 0.1 {
                
                    affiche.text = String(format: "%.2f", result)

                } else if result - Double(Int(result)) > 0.1 && result - Double(Int(result)) < 0.0 {
                    
                    affiche.text = String(format: "%.1f", result)

                } else if result - Double(Int(result)) == 0.0 {*/ // Was meant to avoid displaying too many numbers
            
                    affiche.text = String(result)

               
            }
            
            resultTemp = result
            currentNumber = result
            egalHasBeenPRessed = false
            let random = Int(arc4random_uniform(3))
            commentaires.text = self.commDico[random]
            
            
            currentOperator = sender.titleLabel!.text! as String!
            hasBeenPressed = false
        
        } else {

    
        switch currentOperator{
        
        case "=": result = currentNumber
        case "+": result = result + currentNumber
        case "-": result = result - currentNumber
        case "/": result = resultTemp / currentNumber
        case "*": result = resultTemp * currentNumber
        case "15%": result = resultTemp * 0.15
        case "18%": result = resultTemp * 0.18
        case "20%": result = resultTemp * 0.20
        default: print("Error")
        }
        
        
        if result - Double(Int(currentNumber)) == 0.0 {
            affiche.text = String(Int(result))
            
        } else if result.isNaN || result.isInfinite  == true {
            
            affiche.text = "Autodestruction."
            
        } else if result - Double(Int(result.isFinite)) == 0.0 {
            
            affiche.text = String(Int(result))   
        
        } else {
        
            affiche.text = String(result)
        }
        
            resultTemp = result
            currentNumber = 0
            egalHasBeenPRessed = false
            let random = Int(arc4random_uniform(3))
            commentaires.text = self.commDico[random]
        
        if sender.titleLabel!.text! == "=" {
            currentNumber = 0
        }
        
        currentOperator = sender.titleLabel!.text! as String!
            hasBeenPressed = false
        
    }
    }
    
    

    
    
    /****Delete button******************************************************************************************/
    
    @IBOutlet weak var boutonEffacer: UIButton! // Outlet du bouton effacer

    @IBAction func effaceR(sender: UIButton) { // Delete function
   
        result = 0
        currentNumber = 0
        compteurDeux = 0
        currentOperator = "="
        affiche.text = "\(Int(result))"
        resultTemp = 0.0
        hasBeenPressed = false
        divisionVirgule = 10
        
        
        boutonEffacer.backgroundColor = UIColor.redColor()
       
        
        
    }
    
    
    @IBAction func effacerCouleur(sender: UIButton) {
        
        boutonEffacer.backgroundColor = UIColor.whiteColor()

    }
  
    

   
    @IBAction func virgule(sender: UIButton) { // Check if , has been pressed
        
        hasBeenPressed = true
        
    }
    
    
    /* Styling*/
    
    
    
    
    
    
    
    
}

