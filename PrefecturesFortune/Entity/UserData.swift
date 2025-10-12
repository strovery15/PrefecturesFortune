

import Foundation

struct UserData {
    
    let name: String
    let birthday: YearMonthDay
    let bloodtype: String
    let today: YearMonthDay
    
    struct YearMonthDay {
        let year: Int
        let month: Int
        let day: Int
    }
}
