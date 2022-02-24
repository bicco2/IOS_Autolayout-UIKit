import UIKit

class ViewController: UIViewController {
    
    var bottomContant : NSLayoutConstraint?

    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "MyYellow")
        
        print("loadView_print")
        
        let btnView = UIView()
        btnView.backgroundColor = UIColor(named: "my_button")
        btnView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnView)
        btnView.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            btnView.widthAnchor.constraint(equalToConstant: 100),
            btnView.heightAnchor.constraint(equalToConstant: 50),
            btnView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),//x축 설정
//            btnView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400)// y축 설정
//            btnView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
        bottomContant = NSLayoutConstraint(item: btnView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -100)
        bottomContant?.isActive = true
    
        
        
        
        
        
        
        let moveViewUpBtn = UIButton(type: .system)
        moveViewUpBtn.translatesAutoresizingMaskIntoConstraints = false
        moveViewUpBtn.backgroundColor = .white
        moveViewUpBtn.setTitle("up!!!!!!", for: .normal) //for: .normal의 뜻 : 가만히 있어도 보이게 유지해라
        moveViewUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveViewUpBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)// font와 view의 간격을 말함
        moveViewUpBtn.layer.cornerRadius = 8
        
        self.view.addSubview(moveViewUpBtn) //버튼은 다르게 추가하는 줄 알았는데 view와 같이 addsub으로 똑같이 추가하면 됨
        moveViewUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moveViewUpBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
    
        
        moveViewUpBtn.addTarget(self, action: #selector(onClickedButton), for: .touchUpInside)
        //자기자신을 클릭했을때 셀랙터를 선택하게 되는데  그게 onClickedButton이다 . 언제? 눌릴떄 마다
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    
        
        
    }
    
    @objc
    func onClickedButton(){
        print("btn call")
        bottomContant?.constant -= 100
        //애니메이션 처리
        UIViewPropertyAnimator(duration: 1, curve: .linear, animations: { [weak self] in // 1초 동안 linear 방식(or easeOut)으로 animation 을 처리하겠다
            guard let self = self else {return} //옵셔널 벗기기
            self.view.layoutIfNeeded()//뭐가 변경이 되었으면 레이아웃을 다시 그려라 , 다시 적용시켜라 라는 뜻
        }).startAnimation()
      
    }


}






#if DEBUG //전처리 = 빌드가 되기 전에 처리하는 것, swiftui를 이용한 미리보기
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable
{
    //update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    //makeUI
    @available(iOS 15.2, *) //iOS 15.2 이상 부터 사용 가능하다는 뜻 뭐가? func makeUIViewController 가
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

//이거 스토리보드 없이 코드 자체로 만들 때 프리뷰 보기 위한 설정임
struct ViewController_Previews: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all) // view의 남은 부분 채우기
            .previewDisplayName("응애폰")
    }
}
#endif


