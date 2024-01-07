import UIKit

//MARK: - Final class GameViewController

final class GameViewController: UIViewController {
    
//MARK: - Properties of class
    
    let globalView = UIView()
    
    let infoLabel = UILabel()

    let inputContainerView = UIView()
    let inputTextField = UITextField()
    let inputButton = UIButton()
    
    let scoreStackView = UIStackView()
    let currentScoreLabel = UILabel()
    let theBestScoreLabel = UILabel()
    

    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundVC
        
        addSubviews()
        setConstraintes()
        configUI()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startMessage()
    }
    
    
    
//MARK: - Add subViews
    
    private func addSubviews() {
        
        view.addSubview(globalView)
        
        globalView.addSubviews(with: inputContainerView, scoreStackView, infoLabel)
        
        inputContainerView.addSubviews(with: inputTextField, inputButton)
        scoreStackView.addArrangedSubview(currentScoreLabel)
        scoreStackView.addArrangedSubview(theBestScoreLabel)
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
        inputButton.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor).isActive = true
        inputButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        inputButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
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
        infoLabel.textColor = .green
        infoLabel.text = "YOU WIN!"
        
        
        scoreStackView.backgroundColor = .clear
        scoreStackView.axis = .horizontal
        scoreStackView.distribution = .fillEqually
        
        
        currentScoreLabel.textAlignment = .left
        currentScoreLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        currentScoreLabel.textColor = .black
        currentScoreLabel.text = "Score: 7"
        
        
        theBestScoreLabel.textAlignment = .right
        theBestScoreLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        theBestScoreLabel.textColor = .black
        theBestScoreLabel.text = "Record: 5"
        
        
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
        

    }
    
    
    
//MARK: - Start message
    
    private func startMessage() {
        
        let alert = UIAlertController(title: "Hello!", message: "I wished for a number 1...10. Can you suggest it?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Easy!", style: .default))
        
        present(alert, animated: true)
    }
}

