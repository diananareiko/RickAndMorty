import UIKit

class CharacterTableViewCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = Character
    
    @IBOutlet private var characterImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func configure(with data: Character) {
        titleLabel.text = data.name
        loadImage(from: data.image)
    }
    
    private func loadImage(from url: String) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }.resume()
    }
}
