

import UIKit

protocol MainView: AnyObject {
    
    func showResultDataView(_ prefectureData: PrefectureData)
    func showError()
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
    
    var blurView: UIVisualEffectView! {
        didSet {
            configureBlurView()
        }
    }
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            configureCloseButton()
        }
    }
    
    var resultDataView: ResultDataView! {
        didSet {
            configureResultDataView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstConfiguration()
    }
    
    func firstConfiguration() {
        
        view.backgroundColor = .systemGray6
        
        currentDataView = CurrentDataView()
        blurView = UIVisualEffectView()
        resultDataView = ResultDataView()
        view.addSubview(currentDataView)
        view.addSubview(blurView)
        view.addSubview(resultDataView)
        view.bringSubviewToFront(closeButton)
        
        configureLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifyUserData(_:)), name: .notifyUserData, object: nil)
    }
    
    func configureLayout() {
        
        //startButton
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230 * UIScreen.main.bounds.size.width / 390).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 190 * UIScreen.main.bounds.size.width / 390).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //setDataButton
        setDataButton.translatesAutoresizingMaskIntoConstraints = false
        setDataButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 15 * UIScreen.main.bounds.size.width / 390).isActive = true
        setDataButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setDataButton.widthAnchor.constraint(equalToConstant: 190 * UIScreen.main.bounds.size.width / 390).isActive = true
        setDataButton.heightAnchor.constraint(equalToConstant: 60 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //closeButton
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: resultDataView.bottomAnchor, constant: 70 * UIScreen.main.bounds.size.width / 390).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 190 * UIScreen.main.bounds.size.width / 390).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 80 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //resultDataView
        resultDataView.translatesAutoresizingMaskIntoConstraints = false
        resultDataView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultDataView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        resultDataView.widthAnchor.constraint(equalToConstant: 330 * UIScreen.main.bounds.size.width / 390).isActive = true
        resultDataView.heightAnchor.constraint(equalToConstant: 330 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //currentDataView
        currentDataView.translatesAutoresizingMaskIntoConstraints = false
        currentDataView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        currentDataView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        currentDataView.widthAnchor.constraint(equalToConstant: 250 * UIScreen.main.bounds.size.width / 390).isActive = true
        currentDataView.heightAnchor.constraint(equalToConstant: 160 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //blurView
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        if let userData = userDate {
            presenter.fortuneStart(userData)
        } else {
            let alertController = UIAlertController(title: "スタートできません", message: "データをセットしてスタートしてください", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
    }
    
    @IBAction func setDataButtonAction(_ sender: Any) {
        presenter.setData()
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        resultDataView.isHidden = true
        blurView.isHidden = true
        closeButton.isHidden = true
    }
    
    @objc func notifyUserData(_ notification: Notification) {
        let data = notification.userInfo!["userData"] as! UserData
        self.userDate = data
    }
    
}

extension MainViewController: MainView {
    
    func showResultDataView(_ prefectureData: PrefectureData) {
        resultDataView.prefectureData = prefectureData
        slotAnimation()
    }
    
    func showError() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alertController = UIAlertController(title: "通信エラー", message: "データを取得できませでした", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
        
    }
    
}

extension MainViewController {
    
    //startButton
    func configureStartButton() {
        startButton.setTitle("スタート", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .systemBrown
        startButton.layer.cornerRadius = 8 * UIScreen.main.bounds.size.width / 390
    }
    
    //setDataButton
    func configureSetDataButton() {
        setDataButton.setTitle("データをセット", for: .normal)
        setDataButton.tintColor = .systemBrown
        setDataButton.backgroundColor = .white
        setDataButton.layer.borderWidth = 2 * UIScreen.main.bounds.size.width / 390
        setDataButton.layer.borderColor = UIColor.systemBrown.cgColor
        setDataButton.layer.cornerRadius = 8 * UIScreen.main.bounds.size.width / 390
    }
    
    //currentDataView
    func configureCurrentDataView() {
        currentDataView.layer.borderColor = UIColor.systemBrown.cgColor
        currentDataView.layer.borderWidth = 2 * UIScreen.main.bounds.size.width / 390
        currentDataView.layer.cornerRadius = 10 * UIScreen.main.bounds.size.width / 390
    }
    
    //blurView
    func configureBlurView() {
        let blur = UIBlurEffect(style: .systemUltraThinMaterialLight)
        blurView.effect = blur
        blurView.clipsToBounds = true
        blurView.isHidden = true
    }
    
    //resultDataView
    func configureResultDataView() {
        resultDataView.layer.borderColor = UIColor.systemBrown.cgColor
        resultDataView.layer.borderWidth = 5 * UIScreen.main.bounds.size.width / 390
        resultDataView.layer.cornerRadius = 15 * UIScreen.main.bounds.size.width / 390
        resultDataView.isHidden = true
    }
    
    //closeButton
    func configureCloseButton() {
        closeButton.setTitle("閉じる", for: .normal)
        closeButton.tintColor = .white
        closeButton.backgroundColor = .systemBrown
        closeButton.layer.cornerRadius = 8 * UIScreen.main.bounds.size.width / 390
        closeButton.isHidden = true
    }
    
}

extension MainViewController {
    
    func slotAnimation() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            resultDataView.front()
            resultDataView.isHidden = false
            blurView.isHidden = false
            resultDataView.center = CGPoint(x: -165 * UIScreen.main.bounds.size.width / 390, y: UIScreen.main.bounds.height/2)
            ResultDataView.animate(withDuration: 0.125, delay: 0, options: [.curveLinear], animations: {
                self.resultDataView.center.x += (UIScreen.main.bounds.width + 330 * UIScreen.main.bounds.size.width / 390)
            }, completion: { _ in
                self.resultDataView.center.x = -165 * UIScreen.main.bounds.size.width / 390
                ResultDataView.animate(withDuration: 0.25, delay: 0, options: [.curveLinear], animations: {
                    self.resultDataView.center.x += (UIScreen.main.bounds.width + 330 * UIScreen.main.bounds.size.width / 390)
                }, completion: { _ in
                    self.resultDataView.center.x = -165 * UIScreen.main.bounds.size.width / 390
                    ResultDataView.animate(withDuration: 0.375, delay: 0, options: [.curveLinear], animations: {
                        self.resultDataView.center.x += (UIScreen.main.bounds.width + 330 * UIScreen.main.bounds.size.width / 390)
                    }, completion: { _ in
                        self.resultDataView.center.x = -165 * UIScreen.main.bounds.size.width / 390
                        ResultDataView.animate(withDuration: 0.625, delay: 0, options: [.curveLinear], animations: {
                            self.resultDataView.center.x += (UIScreen.main.bounds.width + 330 * UIScreen.main.bounds.size.width / 390)
                        }, completion: { _ in
                            self.resultDataView.center.x = -165 * UIScreen.main.bounds.size.width / 390
                            ResultDataView.animate(withDuration: 1.0, delay: 0, options: [.curveLinear], animations: {
                                self.resultDataView.center.x += (UIScreen.main.bounds.width/2 + 165 * UIScreen.main.bounds.size.width / 390)
                            }, completion: { _ in
                                self.flipAnimation()
                                
                            })
                        })
                    })
                })
            })
        }
    }
    
    func flipAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            ResultDataView.transition(with: self.resultDataView, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
                self.resultDataView.back()
            }, completion: { _ in
                self.closeButton.isHidden = false
            })
        }
    }
}


