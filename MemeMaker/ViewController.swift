//
//  ViewController.swift
//  MemeMaker
//
//  Created by Da Hae Lee on 2022/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    var topChoices:[CaptionChoice] = [
        CaptionChoice(emoji: "🕶", caption: "You know what's cool?"),
        CaptionChoice(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionChoice(emoji: "❤️", caption: "You know what I love?")
    ]
    var bottomChoices:[CaptionChoice] = [
        CaptionChoice(emoji: "🐱", caption: "Cats wearing hats."),
        CaptionChoice(emoji: "🐶", caption: "Dogs carrying logs."),
        CaptionChoice(emoji: "🐸", caption: "Kermit send me a commit message.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 세그먼트 초기화 및 설정
        topCaptionSegmentedControl.removeAllSegments()
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        // 기본 세그먼트 인덱스 및 레이블 설정 (0)
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        setCaptionLabel(index: topCaptionSegmentedControl.selectedSegmentIndex, is_top: true)
        setCaptionLabel(index: bottomCaptionSegmentedControl.selectedSegmentIndex, is_top: false)
    }

    @IBAction func choiceTopCaptionSegmentedControl(_ sender: Any) {
        let index = topCaptionSegmentedControl.selectedSegmentIndex
        setCaptionLabel(index: index, is_top: true)
    }
    
    @IBAction func choiceBottomCaptionSegmentedControl(_ sender: Any) {
        let index = topCaptionSegmentedControl.selectedSegmentIndex
        setCaptionLabel(index: index, is_top: false)
        
    }
    
    func setCaptionLabel(index:Int, is_top:Bool) {
        if is_top {
            topCaptionLabel.text = topChoices[index].caption
        } else {
            bottomCaptionLabel.text = bottomChoices[index].caption
        }
    }
}

