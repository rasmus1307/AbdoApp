import Foundation

extension NSDate
{
    class func minimumDate() -> NSDate
    {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))!
        return calendar.date(era: 1, year: 1, month: 1, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)! as NSDate
    }

}
