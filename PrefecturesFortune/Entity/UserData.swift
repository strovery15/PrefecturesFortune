

import Foundation

struct UserData: Codable {
    
    let name: String
    let birthday: YearMonthDay
    let blood_type: String
    let today: YearMonthDay
    
    struct YearMonthDay: Codable {
        let year: Int
        let month: Int
        let day: Int
    }
}
