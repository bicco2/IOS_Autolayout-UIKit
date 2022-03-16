//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by 진호병 on 2022/03/16.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileChangeBtn: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self를 붙이면 지금 파일 즉 viewcontroller의 안에 있는 것이라고 확실하게 하는 것
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChangeBtn.layer.cornerRadius = 10
        
        //드래그드랍 안하고 action 설정법
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside) // 근데 #selector 는 뭐지?
        
    }

    //프사 변경 버튼이 클릭되었을때
    @objc fileprivate func onProfileChangeBtnClicked(){
        print("ViewController - onProfileChangeBtnClicked() called")
        
        //카메라 라이브러리 세팅
        var config1 = YPImagePickerConfiguration()
       // config1.screens = [.library, .photo, .video] 3개 불러오기 여기서는 library만 쓰니까 일단 제외
        config1.screens = [.library]
        
        
        let picker = YPImagePicker(configuration: config1)
        
        //사진이 선택되었을 때 밑에 컴플레션 블럭이 실행되면서 코드가 실행됨 (참고 : 컴플레션 블럭 안에서는 self 사용 필수 )
        picker.didFinishPicking { [unowned picker] items, _ in
            
            //여기가 사진이 선택됐을때 무언가 일어나는 코드 블락임 따라서 if 문 안에 프사 변경 코드를 추가 하면 됨
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                self.profileImage.image = photo.image
            }
            // 사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
        
        
    }

        
    
}

