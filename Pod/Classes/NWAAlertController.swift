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
    private var __actions: [UIAlertAction] = []
    
    // MARK: - UIAlertController Public methods
    
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle)
    {
        self.init(preferredStyle: preferredStyle)
        self.message = message
        self.title = title
        
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
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
        __actions += [action]
    }
    
    public var actions: [UIAlertAction] {
        get {
            return __actions
        }
    }
    
    public var preferredAction: UIAlertAction?
    
    public func addTextFieldWithConfigurationHandler(configurationHandler: ((UITextField) -> Void)?)
    {
        fatalError("addTextFieldWithConfigurationHandler: has not been implemented yet")
    }
    
    public var textFields: [UITextField]? {
        get {
            print("TextFields are not implemented yet.")
            return nil
        }
    }
    
    public var message: String?
    
    public var preferredStyle: UIAlertControllerStyle {
        get {
            return __preferredStyle
        }
    }
    
    // MARK: - View lifecycle
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print(self.view.subviews)
    }
    
    // MARK: - Creating the view
    
    public override func loadView()
    {
        let view = UIView(frame: CGRectZero)
        
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        setupDismissTapGestureRecognizerOnView(view)
        
        let alertView = alertViewWithTitle(self.title, message: self.message, actions: self.actions, onView: view)
        view.addSubview(alertView)
        
        
        self.view = view
    }
    
    private func alertViewWithTitle(title: String?, message: String?, actions: [UIAlertAction], onView view: UIView) -> UIView
    {
        var subviews: [UIView] = []
        
        if let title = title {
            let label = UILabel(frame: CGRectZero)
            label.text = title
            label.font = UIFont.boldSystemFontOfSize(20)
            subviews += [label]
        }
        
        if let message = message {
            let label = UILabel(frame: CGRectZero)
            label.text = message
            label.font = UIFont.systemFontOfSize(17)
            subviews += [label]
        }
        
        for action in actions {
            let button = UIButton(type: .System)
            button.setTitle(action.title, forState: .Normal)
            subviews += [button]
        }
        
        let stackView = UIStackView(arrangedSubviews: subviews)
        
        let backgroundView = UIView()
        backgroundView.frame = CGRectMake(0, 0, 20, 20)
        backgroundView.backgroundColor = UIColor.whiteColor()
        stackView.addSubview(backgroundView)
        
        return stackView
    }
    
    // MARK: - Dismiss alert controller
    
    private func setupDismissTapGestureRecognizerOnView(view: UIView)
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapGestureRecognizerTriggered:")
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func tapGestureRecognizerTriggered(sender: UITapGestureRecognizer)
    {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
