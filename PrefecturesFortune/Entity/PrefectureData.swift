

import Foundation

struct PrefectureData: Codable {
    
    let name: String
    let capital: String
    let citizen_day: MonthDay?
    let has_coast_line: Bool
    let logo_url: String
    let brief: String
    
    struct MonthDay: Codable {
        let month: Int
        let day: Int
    }
}
