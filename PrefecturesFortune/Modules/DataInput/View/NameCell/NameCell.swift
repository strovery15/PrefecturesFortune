

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            configureTextField()
        }
    }
    
    @IBOutlet weak var checkButton: UIButton! {
        didSet {
            configureCheckButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func firstConfiguration() {
        
    }
    
    @IBAction func checkButtonAction(_ sender: Any) {
        textField.resignFirstResponder()
        NotificationCenter.default.post(name: .notifyName, object: nil, userInfo: ["name": textField.text!])
    }
    
}

extension NameCell {
    
    //textField
    func configureTextField() {
        textField.font = UIFont.systemFont(ofSize: 20)
    }
    
    //checkButton
    func configureCheckButton() {
        checkButton.setTitle("チェック", for: .normal)
    }
}
