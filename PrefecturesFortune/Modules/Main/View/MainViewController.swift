

import UIKit

protocol MainView: AnyObject {
    
}

class MainViewController: UIViewController {
    
    var presenter: MainPresentation!
    
    var userDate: UserData? {
        didSet {
            currentDataView.userData = userDate
        }
    }
    
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            configureStartButton()
        }
    }
    
    @IBOutlet weak var setDataButton: UIButton! {
        didSet {
            configureSetDataButton()
        }
    }
    
    var currentDataView: CurrentDataView! {
        didSet {
            configureCurrentDataView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstConfiguration()
    }
    
    func firstConfiguration() {
        currentDataView = CurrentDataView()
        view.addSubview(currentDataView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifyUserData(_:)), name: .notifyUserData, object: nil)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        if let userData = userDate {
            presenter.fortuneStart(userData)
        } else {
            let alertController = UIAlertController(title: "データがセットされていません", message: "データをセットしてください", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
    }
    
    @IBAction func setDataButtonAction(_ sender: Any) {
        presenter.setData()
    }
    
    @objc func notifyUserData(_ notification: Notification) {
        let data = notification.userInfo!["userData"] as! UserData
        self.userDate = data
    }
    
}

extension MainViewController: MainView {
    
}

extension MainViewController {
    
    //startButton
    func configureStartButton() {
        startButton.setTitle("スタート", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .systemPink
        startButton.layer.cornerRadius = 8
    }
    
    //setDataButton
    func configureSetDataButton() {
        setDataButton.setTitle("データをセット", for: .normal)
        setDataButton.tintColor = .white
        setDataButton.backgroundColor = .systemBlue
        setDataButton.layer.cornerRadius = 8
    }
    
    //currentDataView
    func configureCurrentDataView() {
        currentDataView.layer.borderColor = UIColor.systemPurple.cgColor
        currentDataView.layer.borderWidth = 1
        currentDataView.layer.cornerRadius = 10
        currentDataView.frame = CGRect(x: 10, y: 100, width: 250, height: 160)
    }
    
}

