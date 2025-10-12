

import UIKit

protocol DataInputView: AnyObject {
    
    func dataInput(_ userData: UserData)
}

class DataInputViewController: UIViewController {
    
    var presenter: DataInputPresentation!
    
    private var name: String = "なまえ"
    private var birthday: Date = Date()
    private var bloodtype: String = "a"
    
    private let nameCellIdentifier = "NameCell"
    private let birthdayCellIdentifier = "BirthdayCell"
    private let bloodtypeCellIdentifier = "BloodtypeCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            configureTableView()
        }
    }
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            configureAddButton()
        }
    }
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            configureCloseButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstConfiguration()
       
    }
    
    func firstConfiguration() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifyName(_:)), name: .notifyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notifyBirthday(_:)), name: .notifyBirthday, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notifyBloodtype(_:)), name: .notifyBloodtype, object: nil)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        presenter.addData(name, birthday, bloodtype, Date())
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc func notifyName(_ notification: Notification) {
        let name = notification.userInfo!["name"] as! String
        self.name = name
    }
    
    @objc func notifyBirthday(_ notification: Notification) {
        let birthday = notification.userInfo!["birthday"] as! Date
        self.birthday = birthday
    }
    
    @objc func notifyBloodtype(_ notification: Notification) {
        let bloodtype = notification.userInfo!["bloodtype"] as! String
        self.bloodtype = bloodtype
    }
    

}

extension DataInputViewController: DataInputView {
    
    func dataInput(_ userData: UserData) {
        print(userData)
        NotificationCenter.default.post(name: .notifyUserData, object: nil, userInfo: ["userData": userData])
        dismiss(animated: true)
    }
}

extension DataInputViewController {
    
    //tableView
    func configureTableView() {
        tableView.register(nameCellnib(), forCellReuseIdentifier: nameCellIdentifier)
        tableView.register(birthdayCellnib(), forCellReuseIdentifier: birthdayCellIdentifier)
        tableView.register(bloodtypeCellnib(), forCellReuseIdentifier: bloodtypeCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func nameCellnib() -> UINib {
        return UINib(nibName: nameCellIdentifier, bundle: nil)
    }
    
    func birthdayCellnib() -> UINib {
        return UINib(nibName: birthdayCellIdentifier, bundle: nil)
    }
    
    func bloodtypeCellnib() -> UINib {
        return UINib(nibName: bloodtypeCellIdentifier, bundle: nil)
    }
    
    //addButton
    func configureAddButton() {
        addButton.setTitle("追加", for: .normal)
        addButton.tintColor = .white
        addButton.backgroundColor = .systemPurple
        addButton.layer.cornerRadius = 5
    }
    
    //closeButton
    func configureCloseButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.tintColor = .systemGray
        closeButton.backgroundColor = .systemGray5
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .small)
        let systemImage = UIImage(systemName: "xmark", withConfiguration: symbolConfiguration)
        closeButton.setImage(systemImage, for: .normal)
        closeButton.layer.cornerRadius = 17
        closeButton.frame = CGRect(x: 20, y: 60, width: 34, height: 34)
        
    }
}

extension DataInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let nameCell = tableView.dequeueReusableCell(withIdentifier: nameCellIdentifier, for: indexPath)
            nameCell.selectionStyle = .none
            return nameCell
            
        case 1:
            let birthdayCell = tableView.dequeueReusableCell(withIdentifier: birthdayCellIdentifier, for: indexPath)
            birthdayCell.selectionStyle = .none
            return birthdayCell
            
        case 2:
            let bloodtypeCell = tableView.dequeueReusableCell(withIdentifier: bloodtypeCellIdentifier, for: indexPath)
            bloodtypeCell.selectionStyle = .none
            return bloodtypeCell
            
        default:
            return UITableViewCell()
        }
    }
    
    
}
