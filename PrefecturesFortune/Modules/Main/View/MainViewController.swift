

import UIKit

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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func firstConfiguration() {
        
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
}

