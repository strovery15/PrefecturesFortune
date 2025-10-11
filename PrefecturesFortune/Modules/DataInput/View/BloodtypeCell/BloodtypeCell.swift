

import UIKit

class BloodtypeCell: UITableViewCell {
    
    let bloodtype = ["A型", "B型", "O型", "AB型"]
    
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
        
        return bloodtype[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: .notifyBloodtype, object: nil, userInfo: ["bloodtype": bloodtype[row]])
    }
}
