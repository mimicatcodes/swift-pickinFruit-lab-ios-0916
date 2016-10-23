import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var spinButton: UIButton!
    
    @IBOutlet weak var fruitPicker: UIPickerView!

    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" 🍎 viewDidLoad 🍇")
        resultLabel.isHidden = true
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(" 🍊 viewWillAppear 🍇")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(" 🍌 viewDidAppear 🍇")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(" 🍐 viewDidDisappear 🍇 ")
        // these are not for apps entering background 
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(" 🍇 viewDidDisappear 🍇")
    }
    
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
    fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 0, animated: true)
        
    fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 1, animated: true)
        
    fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 2, animated: true)
        
    outcome()
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("row is:\(row)")
       return fruitsArray[row]
       
    }
    
    func outcome(){
        let fruit1 = fruitPicker.selectedRow(inComponent: 0)
        let fruit2 = fruitPicker.selectedRow(inComponent: 1)
        let fruit3 = fruitPicker.selectedRow(inComponent: 2)
        
        if fruit1 == fruit2 && fruit2 == fruit3 {
            resultLabel.isHidden = false
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.isHidden = false
            resultLabel.text = "TRY AGAIN"
        }
    }
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}




