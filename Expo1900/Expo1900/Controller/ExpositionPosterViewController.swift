//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

enum PosterLetter {
    static let visitors = "방문객"
    static let location = "개최지"
    static let duration = "개최 기간"
    static let numberOfPeople = " 명"
    static let main = "메인"
    static let entryListViewController = "EntryListViewController"
}

final class ExpositionPosterViewController: UIViewController {
    
    private var poster: ExpositionPoster? {
        didSet {
            updatePoster()
        }
    }
    
    @IBOutlet private weak var posterTitle: UILabel!
    @IBOutlet private weak var visitorsValue: UILabel!
    @IBOutlet private weak var locationValue: UILabel!
    @IBOutlet private weak var durationValue: UILabel!
    @IBOutlet private weak var descriptions: UILabel!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPosterView()
    }
    
    private func setUpPosterView() {
        navigationItem.backButtonTitle = PosterLetter.main
        poster = ExpositionPoster.parse(JsonFile.poster)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func didTapKoreaEntriesList(_ sender: UIButton) {
        guard let entryListViewController = self.storyboard?.instantiateViewController(withIdentifier: PosterLetter.entryListViewController) else {
            return
        }
        self.navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    private func updatePoster() {
        guard let posterTitleText = poster?.title?.replacingOccurrences(of: "(", with: "\n(") else {
            return
        }

        posterTitle.attributedText = NSMutableAttributedString(text: posterTitleText, fontStyle: .title1, letter: posterTitle.text)
        
        let visitorsValueText = "\(PosterLetter.visitors) : \(poster?.visitors?.numberFormatter() ?? "")"
        visitorsValue.attributedText = NSMutableAttributedString(text: visitorsValueText, fontStyle: .title3, letter: PosterLetter.visitors)
        
        let locationValueText = "\(PosterLetter.location) : \(poster?.location ?? "")"
        locationValue.attributedText = NSMutableAttributedString(text: locationValueText, fontStyle: .title3, letter: PosterLetter.location)
        
        let durationValueText = "\(PosterLetter.duration) : \(poster?.duration ?? "")"
        durationValue.attributedText = NSMutableAttributedString(text: durationValueText, fontStyle: .title3, letter: PosterLetter.duration)
        
        descriptions.text = poster?.description
        }
    }
