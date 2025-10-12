

import Foundation

struct PrefectureData {
    
    let name: String
    let capital: String
    let prefecturalDay: MonthDay?
    let hasCoastLine: Bool
    let logo: String
    let overview: String
    
    struct MonthDay {
        let month: String
        let day: String
    }
}
