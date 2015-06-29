import Foundation
import UIKit

//@available(iOS 8.0, *)
//enum UIAlertActionStyle : Int {
//    
//    case Default
//    case Cancel
//    case Destructive
//}

//@available(iOS 8.0, *)
//enum UIAlertControllerStyle : Int {
//    
//    case ActionSheet
//    case Alert
//}

//@available(iOS 8.0, *)
//class UIAlertAction : NSObject, NSCopying {
//    
//    convenience init(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?)
//    
//    var title: String? { get }
//    var style: UIAlertActionStyle { get }
//    var enabled: Bool
//}

@available(iOS 9.0, *)
public class NWAAlertController : UIViewController {
    
    // Private stored variables.
    private var __preferredStyle: UIAlertControllerStyle
    private var __message: String?
    private var __actions: [UIAlertAction] = []
    
    // Public methods; Equivalents of UIAlertController
    
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle)
    {
        self.init(preferredStyle: preferredStyle)
        self.__message = message
        self.title = title
    }
    
    init(preferredStyle: UIAlertControllerStyle)
    {
        self.__preferredStyle = preferredStyle
        super.init(nibName: nil, bundle: nil)
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addAction(action: UIAlertAction)
    {
        
    }
    
    public var actions: [UIAlertAction] {
        get{
            return []
        }
    }
    
    public var preferredAction: UIAlertAction?
    
    public func addTextFieldWithConfigurationHandler(configurationHandler: ((UITextField) -> Void)?)
    {
        
    }
    
    public var textFields: [UITextField]? {
        get {
            return nil
        }
    }
    
    public var message: String?
    
    public var preferredStyle: UIAlertControllerStyle {
        get {
            return UIAlertControllerStyle.Alert
        }
    }
    
    
}

