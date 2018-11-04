import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var displayText = [String]()
    var operation = ""

    var isNumberStored = false
    var storedNumber = 0.0
    var result = 0.0


    override func viewDidLoad() {
        super.viewDidLoad()

        display.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateDisplay() {
        display.text = displayText.joined(separator: "")
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag <= 9 {
            if operation != "" && !isNumberStored {
                storedNumber = getDisplayValue()
                displayText = [String()]
                isNumberStored = true
            }

            displayText.append(String(sender.tag))
            updateDisplay()
        }

        if sender.tag == 18 && !displayText.contains(".") {
            displayText.append(".")
            updateDisplay()
        }

        if sender.tag >= 13 && sender.tag <= 16 {
            if(displayText.isEmpty) {
                displayText = ["0"]
            }

            if(isNumberStored && operation != "") {
                calculate()
                storedNumber = getDisplayValue()
                isNumberStored = false
            }

            if sender.tag == 13 {
                operation = "divide"
            }

            if sender.tag == 14 {
                operation = "multiply"
            }

            if sender.tag == 15 {
                operation = "subtract"
            }

            if sender.tag == 16 {
                operation = "add"
            }

        }

        if sender.tag == 17 {
            calculate()
        }

        if sender.tag == 10 {
            reset()
        }
    }

    func calculate() {
        if(operation == "") {
            return
        }

        if(operation == "divide") {
            result = storedNumber / getDisplayValue()
        }

        if(operation == "multiply") {
            result = storedNumber * getDisplayValue()
        }

        if(operation == "add") {
            result = storedNumber + getDisplayValue()
        }

        if(operation == "subtract") {
            result = storedNumber - getDisplayValue()
        }

        displayText = [String(result)]
        updateDisplay()
    }

    func reset() {
        displayText = [String]()
        display.text = "0"
        storedNumber = 0.0
        operation = ""
        isNumberStored = false
    }

    func getDisplayValue() -> Double {
        return Double(displayText.joined(separator: ""))!
    }

}

