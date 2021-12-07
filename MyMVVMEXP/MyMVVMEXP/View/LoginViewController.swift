//
//  LoginViewController.swift
//  MyMVVMEXP
//
//  Created by Abhik Das on 07/12/21.
//

import UIKit
protocol LoginViewControllerDelegate{
    func getInfoBack(handlerMSG:String?)
    func showErrorByMessage(errmsg:String?)
}
class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        viewModel.loginVCDelegate = self
    }
    func setDelegate(){
        usernameTextField.delegate = self
        passwordTextField.delegate  = self
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        viewModel.sendValue(from: usernameTextField.text, password: passwordTextField.text)
    }
}
extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        usernameTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension LoginViewController:LoginViewControllerDelegate{
    func getInfoBack(handlerMSG: String?) {
        //
        let alert = UIAlertController.init(title: "Alert!", message: handlerMSG, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorByMessage(errmsg: String?) {
        //
        let alert = UIAlertController.init(title: "Alert!", message: errmsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
