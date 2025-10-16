

import UIKit

class BirthdayCell: UITableViewCell {
    
    @IBOutlet weak var stickerLabel: UILabel! {
        didSet {
            configureStickerLabel()
        }
    }
    
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
        contentView.backgroundColor = .systemGray6
        configureLayout()
    }
    
    func configureLayout() {
        
        //stickerLabel
        stickerLabel.translatesAutoresizingMaskIntoConstraints = false
        stickerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        stickerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        stickerLabel.widthAnchor.constraint(equalToConstant: 70 * UIScreen.main.bounds.size.width / 390).isActive = true
        stickerLabel.heightAnchor.constraint(equalToConstant: 30 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //datePicker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: stickerLabel.bottomAnchor).isActive = true
        datePicker.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        datePicker.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
    }
    
    @IBAction func datePickerChange(_ sender: Any) {
        NotificationCenter.default.post(name: .notifyBirthday, object: nil, userInfo: ["birthday": datePicker.date])
    }
    
    
}

extension BirthdayCell {
    
    //stickerLabel
    func configureStickerLabel() {
        stickerLabel.text = "誕生日"
        stickerLabel.textColor = .systemBrown
        stickerLabel.textAlignment = NSTextAlignment.center
//        stickerLabel.backgroundColor = .red
    }
    
    //datePicker
    func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja_JP")
    }
}
