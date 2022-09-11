//
//  Request.swift
//  HaneinWebserver
//
//  Created by Amr Aboelela on 1/26/22.
//  Copyright © 2022 Amr Aboelela. All rights reserved.
//

import Foundation
import Vapor

public extension Request {
    
    var sessionID: String {
        if let sessionCookie = cookieStrings.filter({ $0.range(of: "sessionID") != nil }).first {
            let sessionID = "\(sessionCookie)".replacingOccurrences(of: "sessionID=", with: "").trimmingCharacters(in: .whitespaces)
            //print("sessionID, sessionID: \(sessionID)")
            return sessionID
        }
        return "123"
    }
    
    var cookieStrings: [String] {
        var result = [String]()
        if headers["cookie"].count > 0 {
            if headers["cookie"].count == 1 && headers["cookie"][0].range(of: ";") != nil {
                let rawCookies = headers["cookie"][0]
                rawCookies.split(separator: ";").forEach { rawCookie in
                    result.append("\(rawCookie)".trimmingCharacters(in: .whitespaces))
                }
            } else {
                //let headersCookie = headers["cookie"]
                //print("cookieStrings headers: \(headersCookie)")
                return headers["cookie"]
            }
        } else {
            //print("cookieStrings headers: \(headers)")
            //print("cookieStrings body: \(body)")
        }
        return result
    }
    
    var fromMobile: Bool {
        let mobileArray = ["iPhone", "iPad", "iPod", "midp", "ucweb", "windows ce", "windows mobile", "BlackBerry", "IEMobile", "Opera Mini", "Android"]
        var result = false
        NSLog("fromMobile request: \(self)")
        mobileArray.forEach { token in
            if "\(self)".contains(token) {
                result = true
            }
        }
        return result
    }
    
    var fromTorBrowser: Bool {
        let mobileArray = [".onion"]
        var result = false
        //NSLog("fromMobile request: \(self)")
        mobileArray.forEach { token in
            if "\(self)".contains(token) {
                result = true
            }
        }
        return result
    }
}
