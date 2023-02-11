//
//  Note.swift
//  Note
//
//  Created by Manuel Rodriguez Sebastian on 11/2/23.
//

import Foundation

struct Note: Identifiable, Codable {
    public let id: String
    public let date: Date
    public var title: String
    public var content: String
    
    public var readableDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date)
    }
    
    init(id: String = UUID().uuidString, date: Date = Date(), title: String = "", content: String = "") {
        self.id = id
        self.date = date
        self.title = title
        self.content = content
    }
}
