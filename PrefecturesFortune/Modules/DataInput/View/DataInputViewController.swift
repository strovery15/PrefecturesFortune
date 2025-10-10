

import UIKit

protocol DataInputView: AnyObject {
    
}

class DataInputViewController: UIViewController {
    
    var presenter: DataInputPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
    }

    

}

extension DataInputViewController: DataInputView {
    
}
