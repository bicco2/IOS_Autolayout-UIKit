//
//  ViewController.swift
//  pagerView_tutorial
//
//  Created by 진호병 on 2022/04/02.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
 
    fileprivate let imageNames = ["1.png","2.png","3.png","4.png"]

    
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    
    //이미지 화면 설정
    @IBOutlet weak var myPagerView: FSPagerView!{
        didSet{
            //페이저뷰에 쎌을 등록한다. 오픈소스에 있는 fspagerviewcell이라는 클래스 사용
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            //아이템 크기 설정
            self.myPagerView.itemSize = FSPagerView.automaticSize
            // 무한 스크롤 설정
            self.myPagerView.isInfinite = true
            // 자동 스크롤 설정
            self.myPagerView.automaticSlidingInterval = 4.0
        }
    }
    
    //아래쪽에 순서 표시 이미지 설정
    @IBOutlet weak var myPageControl: FSPageControl!{
        didSet{
            self.myPageControl.numberOfPages = self.imageNames.count
            self.myPageControl.contentHorizontalAlignment = .center
            self.myPageControl.itemSpacing = 16
            self.myPageControl.interitemSpacing = 16
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //상속 받는 클래스를 등록, 즉 연결을 시켜줘야함
        self.myPagerView.dataSource = self
        self.myPagerView.delegate = self
        
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height/2
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height/2
        
    }
    
    
    //MARK: FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    
    //각 셀에대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
       
        //그니까 index 로 image 배열에 있는 이미지 이름을 가져와서 그 이미지 이름에 해당하는 이미지를 view의 이미지뷰에 넣어준다.
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    
    //MARK: IBActions
    @IBAction func onLeftBtnClicked(_ sender: UIButton) {
        self.myPageControl.currentPage = self.myPageControl.currentPage - 1
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    
    @IBAction func onRightBtnClicked(_ sender: UIButton) {
        
        if(self.myPageControl.currentPage == self.imageNames.count - 1){
            self.myPageControl.currentPage = 0
        }else{
          self.myPageControl.currentPage = self.myPageControl.currentPage + 1
        }
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    
    //MARK: FSPagerView Delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.myPageControl.currentPage = targetIndex
        
    }
    // 자동으로 넘어갔을때도 순서표시 이미지가 바뀌도록
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.myPageControl.currentPage = pagerView.currentIndex
    }
    
    //클릭했을때 포커싱 안되게 하는것
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
}

