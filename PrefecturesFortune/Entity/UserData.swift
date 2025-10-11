

import Foundation

struct UserData {
    
    let name: String
    let birthday: YearMonthDay
    let blood_type: String
    let today: YearMonthDay
    
    struct YearMonthDay {
        let year: Int
        let month: Int
        let day: Int
    }
}
