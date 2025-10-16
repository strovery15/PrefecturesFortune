

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
        
        view.backgroundColor = .systemGray6
        if let sheet = self.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                context.maximumDetentValue * 0.88
            })]
        }
        
        configureLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifyName(_:)), name: .notifyName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notifyBirthday(_:)), name: .notifyBirthday, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notifyBloodtype(_:)), name: .notifyBloodtype, object: nil)
    }
    
    func configureLayout() {
        
        //closeButton
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //addButton
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
        tableView.backgroundColor = .systemGray6
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
        addButton.backgroundColor = .systemBrown
        addButton.layer.cornerRadius = 5
    }
    
    //closeButton
    func configureCloseButton() {
        closeButton.setTitle("", for: .normal)
        closeButton.tintColor = .systemGray
        closeButton.backgroundColor = .systemGray4
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .small)
        let systemImage = UIImage(systemName: "xmark", withConfiguration: symbolConfiguration)
        closeButton.setImage(systemImage, for: .normal)
        closeButton.layer.cornerRadius = 20
        closeButton.frame = CGRect(x: 30, y: 30, width: 40, height: 40)
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
