//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Ensar Batuhan Ünverdi on 11.05.2022.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        label.numberOfLines = 0
        return label
    }()
    
    private let overviewLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
    
    private let downloadButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        configureConstraints()
        
        
    }
    
    func configureConstraints() {
        
        webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive                    = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive                          = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive                        = true
        webView.heightAnchor.constraint(equalToConstant: 300).isActive                                  = true
        
        titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20).isActive           = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive         = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive                     = true
        
        overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive     = true
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive      = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive                  = true
        
        downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                   = true
        downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25).isActive = true
        downloadButton.widthAnchor.constraint(equalToConstant: 140).isActive                            = true
        downloadButton.heightAnchor.constraint(equalToConstant: 40).isActive                            = true
        
        
    }
    
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {return}
        
        webView.load(URLRequest(url: url))
    }
    

   

}
