//
//  String.swift
//  HaneinWebserver
//
//  Created by Amr Aboelela on 2/8/22.
//  Copyright © 2022 Amr Aboelela. All rights reserved.
//

import Foundation

let urlRegex = "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)"
let wwwRegex = "www\\.[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)"

public extension String {
    
    var htmlMessage: String {
        var message = self.replacingOccurrences(
            of: urlRegex,
            with: "<a href=$0>$0</a>",
            options: .regularExpression)
        if message.range(of: "http") == nil && message.range(of: "www") != nil {
            message = message.replacingOccurrences(
                of: wwwRegex,
                with: "<a href=http://$0>$0</a>",
                options: .regularExpression)
        }
        message = message.replacingOccurrences(
            of: "#[^ \\\\~!\\-@#$%^&*(){}:\";'?/>\\.<,|\\=`\\[\\]\n\r]+",
            with: "<a href=/h/$0>$0</a>",
            options: .regularExpression)
        message = message.replacingOccurrences(
            of: "<a href=/h/#",
            with: "<a href=/h/")
        message = message.replacingOccurrences(
            of: "/@",
            with: "/at")
        message = message.replacingOccurrences(
            of: "@[a-zA-Z0-9_]+",
            with: "<a href=/u/$0>$0</a>",
            options: .regularExpression)
        message = message.replacingOccurrences(
            of: "<a href=/u/@",
            with: "<a href=/u/")
        message = message.replacingOccurrences(
            of: "/at",
            with: "/@")
        message = message.replacingOccurrences(
            of: "\n",
            with: "<br>")
        return message
    }
    
    var url: String? {
        var result: Substring? = nil
        if let urlRange = self.range(of: urlRegex, options: .regularExpression) {
            result = self[urlRange]
        } else if let wwwRange = self.range(of: wwwRegex, options: .regularExpression) {
            result = self[wwwRange]
        }
        if let result = result {
            //print("result: \(result)")
            return String(result)
        }
        return nil
    }
    
    func base64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
}
