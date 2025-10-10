

import UIKit

protocol MainView: AnyObject {
    
}

class MainViewController: UIViewController {
    
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
    
    var presenter: MainPresentation!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstConfiguration()
        
    }
    
    func firstConfiguration() {
        
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        presenter.fortuneStart()
    }
    
    @IBAction func setDataButtonAction(_ sender: Any) {
        presenter.setData()
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
}

