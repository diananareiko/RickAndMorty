import UIKit
import RxFlow
import RxRelay
import RxSwift

class CharactersViewController: UIViewController, PresentableView, Stepper {
    typealias View = CharactersView
    let steps = PublishRelay<Step>()
    var viewModel: CharactersViewModelType!
    let disposeBag = DisposeBag()
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        bindViewModel()
        viewModel.fetchCharacters(page: .zero)
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CharacterTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
        viewModel.characters
            .bind(to: tableView.rx
                .items(cellIdentifier: "CharacterTableViewCell", cellType: CharacterTableViewCell.self)) { row, element, cell in
                    cell.configure(with: element)
                }
                .disposed(by: disposeBag)
    }
    
    private func setupPagination() {
        tableView.rx.contentOffset
            .flatMapLatest { [weak self] offset -> Observable<Void> in
                guard let self = self else { return .empty() }
                let contentHeight = self.tableView.contentSize.height
                let height = self.tableView.frame.size.height
                let offsetY = offset.y
                let threshold = contentHeight - height - 100.0
                if offsetY > threshold {
                    return Observable.just(())
                }
                return Observable.empty()
            }
            .subscribe(onNext: { [weak self] in
                self?.viewModel.fetchNextPage()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - CharactersView

extension CharactersViewController: CharactersView {
    
}

