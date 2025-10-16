

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var stickerLabel: UILabel! {
        didSet {
            configureStickerLabel()
        }
    }
    
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
        stickerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stickerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stickerLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        stickerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //checkButton
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.topAnchor.constraint(equalTo: stickerLabel.bottomAnchor).isActive = true
        checkButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        //textField
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: stickerLabel.bottomAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo: checkButton.leftAnchor).isActive = true
    }
    
    @IBAction func checkButtonAction(_ sender: Any) {
        textField.resignFirstResponder()
        NotificationCenter.default.post(name: .notifyName, object: nil, userInfo: ["name": textField.text!])
    }
    
}

extension NameCell {
    
    //stickerLabel
    func configureStickerLabel() {
        stickerLabel.text = "名前"
        stickerLabel.textColor = .systemBrown
        stickerLabel.textAlignment = NSTextAlignment.center
//        stickerLabel.backgroundColor = .red
    }
    
    //textField
    func configureTextField() {
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.placeholder = "なまえ"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
//        textField.backgroundColor = .blue
    }
    
    //checkButton
    func configureCheckButton() {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 35 * UIScreen.main.bounds.size.width / 390, weight: .regular, scale: .small)
        let systemImage = UIImage(systemName: "checkmark.circle", withConfiguration: symbolConfiguration)
        checkButton.setTitle("", for: .normal)
        checkButton.setImage(systemImage, for: .normal)
        checkButton.layer.cornerRadius = 17
        checkButton.tintColor = .systemBrown
//        checkButton.backgroundColor = .systemGray
    }
}
