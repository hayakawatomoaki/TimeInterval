//
//  TimeInterval+NSDate.swift
//  TimeInterval
//
//  Created by HAYAKAWA TOMOAKI on 2015/02/06.
//  Copyright (c) 2015年 HAYAKAWA TOMOAKI. All rights reserved.
//

import UIKit

extension NSDate {
    func stringForTimeIntervalSinceCreated() -> String {
        return stringForTimeIntervalSinceCreated(nowDate:NSDate())
        
    }
    
    func stringForTimeIntervalSinceCreated(#nowDate:NSDate) -> String {
        var MinInterval  :Int = 0
        var HourInterval :Int = 0
        var DayInterval  :Int = 0
        var DayModules   :Int = 0
        let interval = abs(Int(self.timeIntervalSinceDate(nowDate)))
        if (interval >= 86400) {
            DayInterval = interval/86400
            DayModules = interval%86400
            if (DayModules != 0) {
                if (DayModules>=3600) {
                    //HourInterval=DayModules/3600;
                    return String(DayInterval) + " days"
                } else {
                    if (DayModules >= 60) {
                        //MinInterval=DayModules/60;
                        return String(DayInterval) + " days"
                    } else {
                        return String(DayInterval) + " days"
                    }
                }
            } else {
                return String(DayInterval) + " days"
            }
        } else {
            if (interval >= 3600) {
                HourInterval = interval/3600
                return String(HourInterval) + " hours"
            } else if (interval >= 60) {
                MinInterval = interval/60
                return String(MinInterval) + " minutes"
            } else {
                return String(interval) + " sec"
            }
        }
    }
}

extension NSDate {
    func toString(#format:String, localeIdentifier:String = "ja_JP") -> String? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        formatter.locale = NSLocale(localeIdentifier: localeIdentifier)
        let dateStr = formatter.stringFromDate(self)
        return dateStr
    }
}

extension String {
    func toDate(#format:String, localeIdentifier:String = "ja_JP") -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        formatter.locale = NSLocale(localeIdentifier: localeIdentifier)
        let date = formatter.dateFromString(self)
        return date
    }
}
