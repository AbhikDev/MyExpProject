
import Foundation
import UIKit
protocol loginViewModelDelegate{
    func sendValue(from email:String?,password:String?)
}
class LoginViewModel : NSObject, loginViewModelDelegate {
        
    
    var loginVCDelegate: LoginViewControllerDelegate?
    private var apiService : ApiService!
    
    override init() {
        super.init()
        self.apiService = ApiService()
    }
    func sendValue(from email: String?, password: String?) {
        guard let emailTXT = email ,!emailTXT.isEmpty else{
            loginVCDelegate?.showErrorByMessage(errmsg: "Enter valid Email")
            return
            
        }
        guard let pwdTXT = password ,!pwdTXT.isEmpty else{
            loginVCDelegate?.showErrorByMessage(errmsg: "Enter valid Password")
            return
            
        }
        if(!emailTXT.isValidEmail()){
            loginVCDelegate?.showErrorByMessage(errmsg: "Enter valid Email")
            return
        }
        apiService?.apiToLogin(userName: emailTXT, password: pwdTXT)
        //loginVCDelegate?.getInfoBack(handlerMSG: "Successfully login by \(emailTXT) and \(pwdTXT)")
        
    }
    

}
