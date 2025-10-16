

import UIKit

protocol MainView: AnyObject {
    
    func appearResultDataView(_ prefectureData: PrefectureData)
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
            configureOpenButton()
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
        
        currentDataView = CurrentDataView()
        blurView = UIVisualEffectView()
        resultDataView = ResultDataView()
        view.addSubview(currentDataView)
        view.addSubview(blurView)
        view.addSubview(resultDataView)
        view.bringSubviewToFront(closeButton)
        
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
    
    func appearResultDataView(_ prefectureData: PrefectureData) {
        resultDataView.prefectureData = prefectureData
        slotAnimation()
    }
    
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
    
    //blurView
    func configureBlurView() {
        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        blurView.effect = blur
        blurView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        blurView.clipsToBounds = true
        blurView.isHidden = true
    }
    
    //resultDataView
    func configureResultDataView() {
        resultDataView.layer.borderColor = UIColor.systemBrown.cgColor
        resultDataView.layer.borderWidth = 5
        resultDataView.layer.cornerRadius = 15
        resultDataView.frame = CGRect(x: 0, y: 0, width: 280, height: 280)
        resultDataView.center = CGPoint(x: -140, y: UIScreen.main.bounds.height/2)
        resultDataView.isHidden = true
    }
    
    //openButton
    func configureOpenButton() {
        closeButton.setTitle("閉じる", for: .normal)
        closeButton.tintColor = .white
        closeButton.backgroundColor = .systemBrown
        closeButton.layer.cornerRadius = 8
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
            ResultDataView.animate(withDuration: 0.125, delay: 0, options: [.curveLinear], animations: {
                self.resultDataView.center.x += (UIScreen.main.bounds.width + 280)
            }, completion: { _ in
                self.resultDataView.center.x = -140
                ResultDataView.animate(withDuration: 0.25, delay: 0, options: [.curveLinear], animations: {
                    self.resultDataView.center.x += (UIScreen.main.bounds.width + 280)
                }, completion: { _ in
                    self.resultDataView.center.x = -140
                    ResultDataView.animate(withDuration: 0.375, delay: 0, options: [.curveLinear], animations: {
                        self.resultDataView.center.x += (UIScreen.main.bounds.width + 280)
                    }, completion: { _ in
                        self.resultDataView.center.x = -140
                        ResultDataView.animate(withDuration: 0.625, delay: 0, options: [.curveLinear], animations: {
                            self.resultDataView.center.x += (UIScreen.main.bounds.width + 280)
                        }, completion: { _ in
                            self.resultDataView.center.x = -140
                            ResultDataView.animate(withDuration: 1.0, delay: 0, options: [.curveLinear], animations: {
                                self.resultDataView.center.x += (UIScreen.main.bounds.width/2 + 140)
                            }, completion: { _ in
                                print("win")
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


