import UIKit

//MARK: - Final class GameViewController

final class GameViewController: UIViewController {
    
//MARK: - Properties of class
    
    //MARK: - Creating of UI
    
    private let globalView = UIView()
    
    private let infoLabel = UILabel()

    private let inputContainerView = UIView()
    private let inputTextField = UITextField()
    private let inputButton = UIButton()
    private let resetButton = UIButton()
    
    private let scoreStackView = UIStackView()
    private let currentScoreLabel = UILabel()
    private let recordScoreLabel = UILabel()
    
    private let maskView = UIView()
    
    //MARK: - Supporting

    private var number = Int.random(in: 1...10)
    private var currentScore = 0
    private var recordScore = 999
  

    
//MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundVC
        
        loadDates()
        
        addSubviews()
        setConstraintes()
        configUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startMessage()
    }
  
    
    
//MARK: - Load dates
    
    private func loadDates() {
        
        currentScore = UserDefaultManager.instance.loadData(key: UserDefaultManager.Keys.currentScore)
        
        let loadedRecordScoreData = UserDefaultManager.instance.loadData(key: UserDefaultManager.Keys.recordScore)
        if loadedRecordScoreData > 0 {
            recordScore = loadedRecordScoreData
        } else {
            recordScore = 999
        }
    }
    
    
    
//MARK: - Add subViews
    
    private func addSubviews() {
        
        view.addSubview(globalView)
        
        globalView.addSubviews(with: inputContainerView, scoreStackView, infoLabel)
        
        inputContainerView.addSubviews(with: inputTextField, inputButton, resetButton)
        scoreStackView.addArrangedSubview(currentScoreLabel)
        scoreStackView.addArrangedSubview(recordScoreLabel)
        inputButton.addSubview(maskView)
    }

    
    
//MARK: - Settings of constraintes
    
    private func setConstraintes() {
        
        globalView.translatesAutoresizingMaskIntoConstraints = false
        globalView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        globalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        globalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        globalView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        
        
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        scoreStackView.topAnchor.constraint(equalTo: globalView.topAnchor, constant: 10).isActive = true
        scoreStackView.centerXAnchor.constraint(equalTo: globalView.centerXAnchor).isActive = true
        scoreStackView.widthAnchor.constraint(equalTo: globalView.widthAnchor, multiplier: 0.95).isActive = true
        scoreStackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: scoreStackView.bottomAnchor, constant: 10).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: globalView.centerXAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalTo: globalView.widthAnchor, multiplier: 0.95).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -10).isActive = true
        
        
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        inputContainerView.centerXAnchor.constraint(equalTo: globalView.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: globalView.centerYAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: globalView.widthAnchor, multiplier: 0.95).isActive = true
        
        
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 10).isActive = true
        inputTextField.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor).isActive = true
        inputTextField.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true


        inputButton.translatesAutoresizingMaskIntoConstraints = false
        inputButton.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -10).isActive = true
        inputButton.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor).isActive = true
        inputButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        inputButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -10).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        maskView.translatesAutoresizingMaskIntoConstraints = false
        maskView.topAnchor.constraint(equalTo: inputButton.topAnchor).isActive = true
        maskView.leadingAnchor.constraint(equalTo: inputButton.leadingAnchor).isActive = true
        maskView.trailingAnchor.constraint(equalTo: inputButton.trailingAnchor).isActive = true
        maskView.bottomAnchor.constraint(equalTo: inputButton.bottomAnchor).isActive = true
        maskView.isHidden = true
    }

    
    
//MARK: - Configurations of UI
    
    private func configUI() {
        
        globalView.backgroundColor = .systemGray
        globalView.layer.cornerRadius = 10
        globalView.layer.borderWidth = 5
        globalView.layer.borderColor = UIColor.purple.cgColor
        
        
        infoLabel.backgroundColor = .clear
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 41, weight: .bold)
        
        
        scoreStackView.backgroundColor = .clear
        scoreStackView.axis = .horizontal
        scoreStackView.distribution = .fillEqually
        
        
        currentScoreLabel.textAlignment = .left
        currentScoreLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        currentScoreLabel.textColor = .black
        currentScoreLabel.text = "Score: \(currentScore)"
        
        
        recordScoreLabel.textAlignment = .right
        recordScoreLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        recordScoreLabel.textColor = .black
        recordScoreLabel.text = "Record: \(recordScore)"
        
        
        inputContainerView.backgroundColor = .clear
        
        
        inputTextField.backgroundColor = .white
        inputTextField.borderStyle = .bezel
        inputTextField.layer.cornerRadius = 5
        inputTextField.layer.borderWidth = 2
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.placeholder = " Enter any 1...10 number!"
        inputTextField.textColor = .black
        
        
        inputButton.backgroundColor = .blue
        inputButton.setTitle("Try!", for: .normal)
        inputButton.setTitleColor(.white, for: .normal)
        inputButton.layer.cornerRadius = 5
        inputButton.layer.borderWidth = 2
        inputButton.layer.borderColor = UIColor.black.cgColor
        inputButton.addTarget(self, action: #selector(inputTapped), for: .touchUpInside)
        
        
        resetButton.backgroundColor = .blue
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        resetButton.layer.cornerRadius = 5
        resetButton.layer.borderWidth = 2
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        
        maskView.backgroundColor = .clear
    }
    
    
    
//MARK: - Actions
    
    @objc private func inputTapped() {
        
        guard let userNumberStr = inputTextField.text, !userNumberStr.isEmpty else {return}
        guard let userNumber = Int(userNumberStr) else {return}
        
        currentScore = currentScore + 1
        currentScoreLabel.text = "Score: \(currentScore)"
        
        if userNumber == self.number {
            infoLabel.alpha = 1
            infoLabel.textColor = .green
            infoLabel.text = "YOU WIN!"
            if currentScore <= recordScore {
                recordScore = currentScore
                recordScoreLabel.text = "Record: \(recordScore)"

                UserDefaultManager.instance.saveData(data: recordScore, key: UserDefaultManager.Keys.recordScore)
            }
            maskView.isHidden = false
            currentScore = 0
        } else {
            infoLabel.alpha = 1
            infoLabel.textColor = .red
            infoLabel.text = "TRY AGAIN!"
            UIView.animate(withDuration: 2) {
                self.infoLabel.alpha = 0
            }
        }
        inputTextField.text = ""
        UserDefaultManager.instance.saveData(data: currentScore, key: UserDefaultManager.Keys.currentScore)
    }
    
    
    @objc private func resetTapped() {
        
        maskView.isHidden = true
        self.number = Int.random(in: 1...10)
        currentScore = 0
        currentScoreLabel.text = "Score: \(currentScore)"
        inputTextField.text = ""
        infoLabel.text = ""
        UserDefaultManager.instance.deleteData(key: UserDefaultManager.Keys.currentScore)
    }
    
    
    
//MARK: - Start message
    
    private func startMessage() {
        
        let alert = UIAlertController(title: "Hello!", message: "I wished for a number 1...10. Can you suggest it?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Easy!", style: .default))
        
        present(alert, animated: true)
    }
}
