//
//  ViewController.swift
//  Tipster
//
//  Created by administrator on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var firstTipLabel: UILabel!
    @IBOutlet weak var secondTipLabel: UILabel!
    @IBOutlet weak var thirdTipLabel: UILabel!
    
    @IBOutlet weak var firstTipResult: UILabel!
    @IBOutlet weak var secondTipResult: UILabel!
    @IBOutlet weak var thirdTipResult: UILabel!
    
    @IBOutlet weak var firstTotal: UILabel!
    @IBOutlet weak var secondTotal: UILabel!
    @IBOutlet weak var thirdTotal: UILabel!
    
    
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var one: UIButton!
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var dot: UIButton!
    
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var groupSize: UILabel!
    @IBOutlet weak var groupSizeSilder: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        groupSize.text! += String(Int(groupSizeSilder.value))
        updateLabels()
    }


    @IBAction func tipSlider(_ sender: UISlider) {
        let tip = Int(sender.value)
        firstTipLabel.text = "\(tip)%"
        secondTipLabel.text = "\(tip+5)%"
        thirdTipLabel.text = "\(tip+10)%"
        updateLabels()
    }
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        groupSize.text = "Group Size:\(String(Int(sender.value)))"
        updateLabels()
    }
    
    
    @IBAction func nineClicked(_ sender: UIButton) {
        addNumberToNumberLabel("9")
    }
    @IBAction func eightClicked(_ sender: UIButton) {
        addNumberToNumberLabel("8")
    }
    @IBAction func sevenClicked(_ sender: UIButton) {
        addNumberToNumberLabel("7")
    }
    
    @IBAction func sixClicked(_ sender: UIButton) {
        addNumberToNumberLabel("6")
    }
    @IBAction func fiveClicked(_ sender: UIButton) {
        addNumberToNumberLabel("5")
    }
    @IBAction func fourClicked(_ sender: UIButton) {
        addNumberToNumberLabel("4")
    }
    
    @IBAction func threeClicked(_ sender: UIButton) {
        addNumberToNumberLabel("3")
    }
    @IBAction func twoClicked(_ sender: UIButton) {
        addNumberToNumberLabel("2")
    }
    @IBAction func oneClicked(_ sender: UIButton) {
        addNumberToNumberLabel("1")
    }
    
    @IBAction func zeroClicked(_ sender: UIButton) {
        addNumberToNumberLabel("0")
    }
    @IBAction func dotClicked(_ sender: UIButton) {
        addNumberToNumberLabel(".")
    }
    @IBAction func cancelClikced(_ sender: UIButton) {
        numberLabel.text = ""
        
    }
    
    private func addNumberToNumberLabel(_ number: String){
        numberLabel.text! += number
        updateLabels()
    }
    
    private func getTipResult(_ tip: Float) -> String{
        guard let number = Float(numberLabel.text!) else { return "0.00" }
        let size = round(Float(groupSizeSilder.value))
        let tempTip = tip / 100.0
        let result = number * tempTip / size
        return String(format: "%.2f", result)
    }
    private func getTotal(_ tip: Float) -> String{
        guard let number = Float(numberLabel.text!) else { return "0.00" }
        let result = number + tip
        return String(result)
    }
    private func updateLabels(){
        let tipResult1 = getTipResult(tipSlider.value)
        let total1 = getTotal(Float(tipResult1) ?? 0.00)
        firstTipResult.text = tipResult1
        firstTotal.text = total1
        
        let tipResult2 = getTipResult(tipSlider.value + 5)
        let total2 = getTotal(Float(tipResult2) ?? 0.00)
        secondTipResult.text = tipResult2
        secondTotal.text = total2
        
        let tipResult3 = getTipResult(tipSlider.value + 10)
        let total3 = getTotal(Float(tipResult3) ?? 0.00)
        thirdTipResult.text = tipResult3
        thirdTotal.text = total3
    }
}

