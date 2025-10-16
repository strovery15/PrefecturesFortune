

import UIKit

class ResultDataView: UIView {
    
    var prefectureData: PrefectureData! {
        didSet {
            update()
        }
    }
    
    var front: (() -> Void)!
    var back: (() -> Void)!
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var prefectureNameLabel: UILabel! {
        didSet {
            configurePrefectureNameLabel()
        }
    }
    
    @IBOutlet weak var capitalLabel: UILabel! {
        didSet {
            configureCapitalLabel()
        }
    }
    
    @IBOutlet weak var citizenDayLabel: UILabel! {
        didSet {
            configureCitizenDayLabel()
        }
    }
    
    @IBOutlet weak var hasCoastLabel: UILabel! {
        didSet {
            configureHasCoastLabel()
        }
    }
    
    @IBOutlet weak var prefectureLogoImageView: UIImageView! {
        didSet {
            configurePrefectureLogoImageView()
        }
    }
    
    @IBOutlet weak var prefectureBriefTextView: UITextView! {
        didSet {
            configurePrefectureBriefTextView()
        }
    }
    
    
    var backLabel1: UILabel! {
        didSet {
            configureBackLabel1()
        }
    }
    var backLabel2: UILabel! {
        didSet {
            configureBackLabel2()
        }
    }
    var backLabel3: UILabel! {
        didSet {
            configureBackLabel3()
        }
    }
    var backLabel4: UILabel! {
        didSet {
            configureBackLabel4()
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
        
        view.layer.cornerRadius = 15 * UIScreen.main.bounds.size.width / 390
        
        backLabel1 = UILabel()
        backLabel2 = UILabel()
        backLabel3 = UILabel()
        backLabel4 = UILabel()
        view.addSubview(backLabel1)
        view.addSubview(backLabel2)
        view.addSubview(backLabel3)
        view.addSubview(backLabel4)
        
        configureLayout()
        
        front = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                backLabel1.isHidden = false
                backLabel2.isHidden = false
                backLabel3.isHidden = false
                backLabel4.isHidden = false
            }
        }
        
        back = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                backLabel1.isHidden = true
                backLabel2.isHidden = true
                backLabel3.isHidden = true
                backLabel4.isHidden = true
            }
        }
        
    }
    
    func configureLayout() {
        
        //prefectureLogoImageView
        prefectureLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        prefectureLogoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureLogoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureLogoImageView.widthAnchor.constraint(equalToConstant: 120 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureLogoImageView.heightAnchor.constraint(equalToConstant: 120 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //prefectureNameLabel
        prefectureNameLabel.translatesAutoresizingMaskIntoConstraints = false
        prefectureNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureNameLabel.leftAnchor.constraint(equalTo: prefectureLogoImageView.rightAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureNameLabel.widthAnchor.constraint(equalToConstant: 200 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureNameLabel.heightAnchor.constraint(equalToConstant: 30 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //capitalLabel
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.topAnchor.constraint(equalTo: prefectureNameLabel.bottomAnchor).isActive = true
        capitalLabel.leftAnchor.constraint(equalTo: prefectureLogoImageView.rightAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        capitalLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        capitalLabel.widthAnchor.constraint(equalToConstant: 200 * UIScreen.main.bounds.size.width / 390).isActive = true
        capitalLabel.heightAnchor.constraint(equalToConstant: 30 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //citizenDayLabel
        citizenDayLabel.translatesAutoresizingMaskIntoConstraints = false
        citizenDayLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor).isActive = true
        citizenDayLabel.leftAnchor.constraint(equalTo: prefectureLogoImageView.rightAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        citizenDayLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        citizenDayLabel.widthAnchor.constraint(equalToConstant: 200 * UIScreen.main.bounds.size.width / 390).isActive = true
        citizenDayLabel.heightAnchor.constraint(equalToConstant: 30 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //hasCoastLabel
        hasCoastLabel.translatesAutoresizingMaskIntoConstraints = false
        hasCoastLabel.topAnchor.constraint(equalTo: citizenDayLabel.bottomAnchor).isActive = true
        hasCoastLabel.leftAnchor.constraint(equalTo: prefectureLogoImageView.rightAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        hasCoastLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        hasCoastLabel.widthAnchor.constraint(equalToConstant: 200 * UIScreen.main.bounds.size.width / 390).isActive = true
        hasCoastLabel.heightAnchor.constraint(equalToConstant: 30 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //prefectureBriefTextView
        prefectureBriefTextView.translatesAutoresizingMaskIntoConstraints = false
        prefectureBriefTextView.topAnchor.constraint(equalTo: prefectureLogoImageView.bottomAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureBriefTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureBriefTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureBriefTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureBriefTextView.heightAnchor.constraint(equalToConstant: 200 * UIScreen.main.bounds.size.width / 390).isActive = true
        prefectureBriefTextView.widthAnchor.constraint(equalToConstant: 330 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //backLabel1
        backLabel1.translatesAutoresizingMaskIntoConstraints = false
        backLabel1.topAnchor.constraint(equalTo: view.topAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel1.widthAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel1.heightAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //backLabel2
        backLabel2.translatesAutoresizingMaskIntoConstraints = false
        backLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel2.widthAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel2.heightAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //backLabel3
        backLabel3.translatesAutoresizingMaskIntoConstraints = false
        backLabel3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel3.widthAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel3.heightAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        
        //backLabel4
        backLabel4.translatesAutoresizingMaskIntoConstraints = false
        backLabel4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel4.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel4.widthAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
        backLabel4.heightAnchor.constraint(equalToConstant: 165 * UIScreen.main.bounds.size.width / 390).isActive = true
    }
    
    func update() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
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
            
            let logoImage = UIImage(urlString: prefectureData.logo_url)
            prefectureLogoImageView.image = logoImage
            
            prefectureBriefTextView.text = prefectureData.brief
        }
        
    }
    
}

extension ResultDataView {
    
    //prefectureNameLabel
    func configurePrefectureNameLabel() {
        prefectureNameLabel.text = "県の名前"
    }
    
    //capitalLabel
    func configureCapitalLabel() {
        capitalLabel.text = "県庁所在地の名前"
    }
    
    //citizenDayLabel
    func configureCitizenDayLabel() {
        citizenDayLabel.text = "県民の日なし"
    }
    
    //hasCoastLabel
    func configureHasCoastLabel() {
        hasCoastLabel.text = "海岸線の有無"
    }
    
    //prefectureLogoImageView
    func configurePrefectureLogoImageView() {
        prefectureLogoImageView.tintColor = .systemBrown
    }
    
    //prefectureBriefTextView
    func configurePrefectureBriefTextView() {
        prefectureBriefTextView.font = UIFont.systemFont(ofSize: 12)
        prefectureBriefTextView.isEditable = false
    }
    
    //backLabel1
    func configureBackLabel1() {
        backLabel1.text = "都"
        backLabel1.layer.cornerRadius = 15 * UIScreen.main.bounds.size.width / 390
        backLabel1.font = UIFont.systemFont(ofSize: 50 * UIScreen.main.bounds.size.width / 390)
        backLabel1.textColor = .white
        backLabel1.backgroundColor = .systemBrown
        backLabel1.textAlignment = NSTextAlignment.center
        backLabel1.isHidden = true
    }
    
    //backLabel2
    func configureBackLabel2() {
        backLabel2.text = "道"
        backLabel2.layer.cornerRadius = 15 * UIScreen.main.bounds.size.width / 390
        backLabel2.font = UIFont.systemFont(ofSize: 50 * UIScreen.main.bounds.size.width / 390)
        backLabel2.textColor = .systemBrown
        backLabel2.backgroundColor = .white
        backLabel2.textAlignment = NSTextAlignment.center
        backLabel2.isHidden = true
    }
    
    //backLabel3
    func configureBackLabel3() {
        backLabel3.text = "府"
        backLabel3.layer.cornerRadius = 15 * UIScreen.main.bounds.size.width / 390
        backLabel3.font = UIFont.systemFont(ofSize: 50 * UIScreen.main.bounds.size.width / 390)
        backLabel3.textColor = .systemBrown
        backLabel3.backgroundColor = .white
        backLabel3.textAlignment = NSTextAlignment.center
        backLabel3.isHidden = true
    }
    
    //backLabel4
    func configureBackLabel4() {
        backLabel4.text = "県"
        backLabel4.layer.cornerRadius = 15 * UIScreen.main.bounds.size.width / 390
        backLabel4.font = UIFont.systemFont(ofSize: 50 * UIScreen.main.bounds.size.width / 390)
        backLabel4.textColor = .white
        backLabel4.backgroundColor = .systemBrown
        backLabel4.textAlignment = NSTextAlignment.center
        backLabel4.isHidden = true
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
