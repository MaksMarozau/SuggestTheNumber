import UIKit

//MARK: - Final class StartGameViewController

final class StartGameViewController: UIViewController {

//MARK: - Properties of class
    
    private let newGameButton = UIButton()
    private let continueGameButton = UIButton()
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubviews(with: newGameButton, continueGameButton)

        setConstraintes()
        configUI()
    }
    
    
    
//MARK: - Set constraintes
    
    private func setConstraintes() {
        
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 45).isActive = true
        newGameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        newGameButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        continueGameButton.translatesAutoresizingMaskIntoConstraints = false
        continueGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -45).isActive = true
        continueGameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        continueGameButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    
//MARK: - Configurations of UI
    
    private func configUI() {
        
        newGameButton.backgroundColor = .green
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.setTitleColor(.white, for: .normal)
        newGameButton.layer.cornerRadius = 5
        newGameButton.layer.borderColor = UIColor.white.cgColor
        newGameButton.layer.borderWidth = 2
        newGameButton.addTarget(self, action: #selector(newGameTapped), for: .touchUpInside)
        
        
        continueGameButton.backgroundColor = .blue
        continueGameButton.setTitle("Continue Game", for: .normal)
        continueGameButton.setTitleColor(.white, for: .normal)
        continueGameButton.layer.cornerRadius = 5
        continueGameButton.layer.borderColor = UIColor.white.cgColor
        continueGameButton.layer.borderWidth = 2
        continueGameButton.addTarget(self, action: #selector(continueGameTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func newGameTapped() {
        
        UserDefaultManager.instance.deleteData(key: UserDefaultManager.Keys.currentScore)
        UserDefaultManager.instance.deleteData(key: UserDefaultManager.Keys.recordScore)

        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc private func continueGameTapped() {
        
        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
