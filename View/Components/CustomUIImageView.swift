import UIKit

class CustomUIImageView: UIImageView {

    private var action: (() -> Void)?

    required override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isUserInteractionEnabled = true
    }

    init(action: (() -> Void)?) {
        super.init(frame: .zero)
        setup(action: action)
    }

   
    
    func setup(action: (() -> Void)?) {
     
        self.action = action
        isUserInteractionEnabled = true  // Enable user interaction
        self.translatesAutoresizingMaskIntoConstraints = false

        if action != nil {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            self.addGestureRecognizer(tapGesture)
        }
    }

    @objc func imageTapped() {
        action?()  // Perform the action if provided
    }
}
