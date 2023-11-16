import MarvelCore

public class HomeViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var comicsTableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    var delegate: HomeViewModelDelegateProtocol?
    
    public var internalDelegate: HomeViewControllerInternalDelegateProtocol?
    
    public override func viewDidLoad() {
        self.comicsTableView.dataSource = self
        viewModel?.requestList()
    }
}

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.comics?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comicCell =
            self.comicsTableView.dequeueReusableCell(withIdentifier: "cell",
                                                     for: indexPath) as UITableViewCell

        comicCell.textLabel?.text = viewModel?.comics?[indexPath.row].tableItemFormat()
        return comicCell
    }
}

extension HomeViewController: HomeViewModelDelegateProtocol {
    func homeEvent(state: ViewControllerState) {
        switch state {
            case .loading:
                self.activityIndicator.startAnimating()
            case .error:
                self.activityIndicator.stopAnimating()
                
                let alert = UIAlertController(title: "Failed", message: "Unable to Load", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            case .success:
                self.activityIndicator.stopAnimating()
                self.comicsTableView.reloadData()
        }
    }
}
