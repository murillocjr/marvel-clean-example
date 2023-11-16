import MarvelCore

public class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModelProtocol?
    
    public var internalDelegate: LoginViewControllerInternalDelegateProtocol?
    public var externalDelegate: LoginViewControllerExternalDelegateProtocol?
    
    @IBAction func onTapLogin(_ sender: Any) {
        if let userName = usernameInput.text, let password = passwordInput.text {
            viewModel?.requestLogin(username: userName, password: password)
        }
    }
    
    @IBAction func tapTutorial(_ sender: Any) {
        internalDelegate?.LoginViewControllerDidAskForTutorial()
    }
}

extension LoginViewController: LoginViewModelDelegateProtocol {
    func loginEvent(state: ViewControllerState) {
        switch state {
            case .loading:
                self.activityIndicator.startAnimating()
                self.usernameInput.isEnabled = false
                self.passwordInput.isEnabled = false
                self.loginButton.isEnabled = false
            case .error:
                self.activityIndicator.stopAnimating()
                self.usernameInput.isEnabled = true
                self.passwordInput.isEnabled = true
                self.loginButton.isEnabled = true
                
                let alert = UIAlertController(title: "Failed", message: "Unable to login", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            case .success:
                self.activityIndicator.stopAnimating()
                self.externalDelegate?.LoginViewControllerDidSuccessLogin()
        }
    }
}
