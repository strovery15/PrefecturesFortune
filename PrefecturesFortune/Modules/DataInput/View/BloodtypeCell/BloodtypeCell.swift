

import UIKit

class BloodtypeCell: UITableViewCell {
    
    //bloodtypeの要素を変更する際はBloodtypeCell.displayとCurrentDataView.displayを変更する
    let bloodtype = ["a", "b", "o", "ab"]
    let display: [String: String] = ["a": "A型", "b": "B型", "o": "O型", "ab": "AB型"]
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            configurePickerView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstConfiguration()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func firstConfiguration() {
        
    }
    
}

extension BloodtypeCell {
    
    //pickerView
    func configurePickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
}

extension BloodtypeCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return bloodtype.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return display[bloodtype[row]]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .notifyBloodtype, object: nil, userInfo: ["bloodtype": bloodtype[row]])
    }
}
