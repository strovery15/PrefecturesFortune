

import UIKit

class BloodtypeCell: UITableViewCell {
    
    //bloodtypeの要素を変更する際はBloodtypeCell.displayとCurrentDataView.displayを変更する
    let bloodtype = ["a", "b", "o", "ab"]
    let display: [String: String] = ["a": "A型", "b": "B型", "o": "O型", "ab": "AB型"]
    
    
    @IBOutlet weak var stickerLabel: UILabel! {
        didSet {
            configureStickerLabel()
        }
    }
    
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
        
        //pickerView
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: stickerLabel.bottomAnchor).isActive = true
        pickerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        pickerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 180 * UIScreen.main.bounds.size.width / 390).isActive = true
    }
    
}

extension BloodtypeCell {
    
    //stickerLabel
    func configureStickerLabel() {
        stickerLabel.text = "血液型"
        stickerLabel.textColor = .systemBrown
        stickerLabel.textAlignment = NSTextAlignment.center
//        stickerLabel.backgroundColor = .red
    }
    
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
