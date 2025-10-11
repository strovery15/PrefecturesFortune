

import UIKit

class CurrentDataView: UIView {
    
    var userData: UserData! {
        didSet {
            updateData()
        }
    }
    
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
        
    }
    
    func updateData() {
        nameLabel.text = "名前  \(userData.name)"
        
        let birYear = userData.birthday.year
        let birMonth = userData.birthday.month
        let birDay = userData.birthday.day
        birthdayLabel.text = "誕生日  \(birYear)年\(birMonth)月\(birDay)日"
        
        bloodtypeLabel.text = "血液型  \(userData.blood_type)"
        
        let todaYear = userData.today.year
        let todaMonth = userData.today.month
        let todaDay = userData.today.day
        todayLabel.text = "今日の日付  \(todaYear)年\(todaMonth)月\(todaDay)日"
        
        
        
    }

}

extension CurrentDataView {
    
    //nameLabel
    func configureNameLabel() {
        nameLabel.text = "名前  ----"
        nameLabel.backgroundColor = .systemGray6
    }
    
    //birthdayLabel
    func configureBirthdayLabel() {
        birthdayLabel.text = "誕生日  ----"
        birthdayLabel.backgroundColor = .systemGray6
    }
    
    //bloodtypeLabel
    func configureBloodtypeLabel() {
        bloodtypeLabel.text = "血液型  ----"
        bloodtypeLabel.backgroundColor = .systemGray6
    }
    
    //todayLabel
    func configureTodayLabel() {
        todayLabel.text = "今日の日付  ----"
        todayLabel.backgroundColor = .systemGray6
    }
}
