import Foundation

//MARK: - Final class UserDefaultManager

final class UserDefaultManager {
    
//MARK: - Properties of class
    
    //MARK: - Implementing of the singleton function
    
    static let instance = UserDefaultManager()
    private init() { }
    

    
    //MARK: - Enum with data-keys
    
    enum Keys: String {
        case currentScore = "currentScore"
        case recordScore = "recordScore"
    }
    
    
    
//MARK: - Methods of class
    
    func saveData(data: Int, key: Keys) {
        UserDefaults.standard.setValue(data, forKey: key.rawValue)
        print("saved \(data)")
    }
    
    func loadData(key: Keys) -> Int {
        let intager =  UserDefaults.standard.integer(forKey: key.rawValue)
            return intager
    }
    
    func deleteData(key: Keys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
