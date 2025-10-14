

import UIKit

class ResultDataView: UIView {
    
    var prefectureData: PrefectureData! {
        didSet {
            update()
        }
    }
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var prefectureNameLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var citizenDayLabel: UILabel!
    
    @IBOutlet weak var hasCoastLabel: UILabel!
    
    @IBOutlet weak var prefectureLogoImageView: UIImageView!
    
    @IBOutlet weak var prefectureBriefTextView: UITextView!
    
    init() {
        super.init(frame: .zero)
        loadView()
        firstConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView() {
        Bundle.main.loadNibNamed("\(ResultDataView.self)", owner: self)
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
    
    func update() {
        prefectureNameLabel.text = prefectureData.name
        
        capitalLabel.text = prefectureData.capital
        
        if let citizenDay = prefectureData.citizen_day {
            citizenDayLabel.text = "\(citizenDay.month)月\(citizenDay.day)日"
        }
        
        if prefectureData.has_coast_line {
            hasCoastLabel.text = "海に面している県"
        } else {
            hasCoastLabel.text = "内陸の県"
        }
        
        let logoImage = UIImage(urlString: "httpbabubabu")
        prefectureLogoImageView.image = logoImage
        
        prefectureBriefTextView.text = prefectureData.brief
        
    }
    
}

extension UIImage {
    public convenience init(urlString: String) {
        let url = URL(string: urlString)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let error {
            print(error)
        }
        self.init(systemName: "questionmark")!
    }
}
