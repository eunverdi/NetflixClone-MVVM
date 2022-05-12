//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Ensar Batuhan Ünverdi on 7.05.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive               = true
        titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive         = true
        titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive  = true
        titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100).isActive                               = true
        
        titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive                            = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        
        playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive      = true
        playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive                       = true
    }
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil )
        titleLabel.text = model.titleName
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
   

}
