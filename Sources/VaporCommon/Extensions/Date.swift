//
//  Date.swift
//  VaporCommon
//
//  Created by Amr Aboelela on 6/8/22.
//  Copyright © 2022 Amr Aboelela. All rights reserved.
//

import Foundation

public extension Date {

    // Example: Thu, 03 Feb 2022 02:19:01 GMT
    var cookieFormattedString: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "EEE, dd MMM YYYY HH:mm:ss zzz"
        return formatter.string(from: self)
    }

}
