

import Foundation

protocol CreateUserDataUseCase {
    func execute(parameter1: String, parameter2: Date, parameter3: String, parameter4: Date, completion: ((Result<UserData, Never>) -> ()))
}

class CreateUserDataInteractor: CreateUserDataUseCase {
    
    let locationId = "ja_JP"
    
    func execute(parameter1: String, parameter2: Date, parameter3: String, parameter4: Date, completion: ((Result<UserData, Never>) -> ())) {
        
        let param2Year = FormatYear(parameter2)
        let param2Month = FormatMonth(parameter2)
        let param2Day = FormatDay(parameter2)
        
        let param4Year = FormatYear(parameter4)
        let param4Month = FormatMonth(parameter4)
        let param4Day = FormatDay(parameter4)
        
        let userData = UserData(
            name: parameter1,
            birthday: .init(year: param2Year, month: param2Month, day: param2Day),
            bloodtype: parameter3,
            today: .init(year: param4Year, month: param4Month, day: param4Day)
        )
        completion(.success(userData))
    }
    
    private func FormatYear(_ date: Date) -> Int {
        let yearFormatter = DateFormatter()
        yearFormatter.locale = Locale(identifier: locationId)
        yearFormatter.timeZone = TimeZone(identifier: locationId)
        yearFormatter.dateFormat = "yyyy"
        let year = Int(yearFormatter.string(from: date))!
        return year
    }
    
    private func FormatMonth(_ date: Date) -> Int {
        let monthFormatter = DateFormatter()
        monthFormatter.locale = Locale(identifier: locationId)
        monthFormatter.timeZone = TimeZone(identifier: locationId)
        monthFormatter.dateFormat = "MM"
        let month = Int(monthFormatter.string(from: date))!
        return month
    }
    
    private func FormatDay(_ date: Date) -> Int {
        let dayFormatter = DateFormatter()
        dayFormatter.locale = Locale(identifier: locationId)
        dayFormatter.timeZone = TimeZone(identifier: locationId)
        dayFormatter.dateFormat = "dd"
        let day = Int(dayFormatter.string(from: date))!
        return day
        
    }
    
}
