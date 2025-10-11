

import UIKit

class BirthdayCell: UITableViewCell {
    
    
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            configureDatePicker()
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
    
    @IBAction func datePickerChange(_ sender: Any) {
        NotificationCenter.default.post(name: .notifyBirthday, object: nil, userInfo: ["birthday": datePicker.date])
    }
    
    
}

extension BirthdayCell {
    
    //datePicker
    func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ja_JP")
    }
}
