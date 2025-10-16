

import UIKit

class CurrentDataView: UIView {
    
    var userData: UserData! {
        didSet {
            updateData()
        }
    }
    
    let display: [String: String] = ["a": "A型", "b": "B型", "o": "O型", "ab": "AB型"]
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            configureNameLabel()
        }
    }
    
    @IBOutlet weak var birthdayLabel: UILabel! {
        didSet {
            configureBirthdayLabel()
        }
    }
    
    @IBOutlet weak var bloodtypeLabel: UILabel! {
        didSet {
            configureBloodtypeLabel()
        }
    }
    
    @IBOutlet weak var todayLabel: UILabel! {
        didSet {
            configureTodayLabel()
        }
    }
    
    init() {
        super.init(frame: .zero)
        loadView()
        firstConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView() {
        Bundle.main.loadNibNamed("\(CurrentDataView.self)", owner: self)
       addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
        ])
    }
    
    func firstConfiguration() {
        configureLayout()
    }
    
    func configureLayout() {
        
        //nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //birthdayLabel
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        birthdayLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        birthdayLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        birthdayLabel.heightAnchor.constraint(equalToConstant: 40 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //bloodtypeLabel
        bloodtypeLabel.translatesAutoresizingMaskIntoConstraints = false
        bloodtypeLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor).isActive = true
        bloodtypeLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bloodtypeLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bloodtypeLabel.heightAnchor.constraint(equalToConstant: 40 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //todayLabel
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.topAnchor.constraint(equalTo: bloodtypeLabel.bottomAnchor).isActive = true
        todayLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        todayLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        todayLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        todayLabel.heightAnchor.constraint(equalToConstant: 40 * UIScreen.main.bounds.size.width / 390).isActive = true
    }
    
    func updateData() {
        nameLabel.text = "\u{3000}名前\u{3000}\u{3000}\(userData.name)"
        
        let birYear = userData.birthday.year
        let birMonth = userData.birthday.month
        let birDay = userData.birthday.day
        birthdayLabel.text = "\u{3000}誕生日\u{3000}\(birYear)年\(birMonth)月\(birDay)日"
        
        bloodtypeLabel.text = "\u{3000}血液型\u{3000}\(display[userData.blood_type]!)"
        
        let todaYear = userData.today.year
        let todaMonth = userData.today.month
        let todaDay = userData.today.day
        todayLabel.text = "\u{3000}日付\u{3000}\u{3000}\(todaYear)年\(todaMonth)月\(todaDay)日"
        
    }

}

extension CurrentDataView {
    
    //nameLabel
    func configureNameLabel() {
        nameLabel.text = "\u{3000}名前\u{3000}\u{3000}----"
        nameLabel.backgroundColor = .systemGray6
    }
    
    //birthdayLabel
    func configureBirthdayLabel() {
        birthdayLabel.text = "\u{3000}誕生日\u{3000}----"
        birthdayLabel.backgroundColor = .systemGray6
    }
    
    //bloodtypeLabel
    func configureBloodtypeLabel() {
        bloodtypeLabel.text = "\u{3000}血液型\u{3000}----"
        bloodtypeLabel.backgroundColor = .systemGray6
    }
    
    //todayLabel
    func configureTodayLabel() {
        todayLabel.text = "\u{3000}日付\u{3000}\u{3000}----"
        todayLabel.backgroundColor = .systemGray6
    }
}
