import Foundation

final class UserDefaultManager {
    
    static let instance = UserDefaultManager()
    private init() { }
    
    enum Keys: String {
        case currentScore = "currentScore"
        case recordScore = "recordScore"
    }
    
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
