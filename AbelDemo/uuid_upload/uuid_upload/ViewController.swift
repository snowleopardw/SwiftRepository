import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // http://stackoverflow.com/questions/20944932/how-to-get-device-udid-in-programatically-in-ios7
        let uuid = UIDevice.currentDevice().identifierForVendor!.UUIDString
        print("uuid=",uuid)
        // uuid= 986EBCEB-F59F-40C4-AEA9-A134DE60A219 6s-puls
        // uuid= 04A5C74E-D345-452C-84F6-A29F62DCA0F0 6s

        // http://stackoverflow.com/questions/26364914/http-request-in-swift-with-post-method
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
