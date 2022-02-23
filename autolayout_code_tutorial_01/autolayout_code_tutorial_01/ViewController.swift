import UIKit

class ViewController: UIViewController {

    //클로저로 뷰를 설정 second 뷰를 만드는데 view를 생성하고 설정값 준뒤 return 하면 second 뷰에 들어간다.
    var mySecondView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var myThirdView : MyCircleView = {
       let circleView = MyCircleView()
        circleView.backgroundColor = .green
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false //코드로 오토레이아웃 설정할때 필수 설정
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView) //여기서 self는 viewcontroller
        
        //x,y위치
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true //x축 설정
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true // y축 설정
        //여기서 equalTo는 relation임
        
        //가로,세로
        myFirstView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        myFirstView.layer.cornerRadius = 30
        
        self.view.addSubview(mySecondView)
        
        NSLayoutConstraint.activate([//.isActive = true 안 붙이는 법
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
             mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
             mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20),
        ])
        
        self.view.addSubview(myThirdView) // 뷰 하나를 추가 하겠다 라는 뜻
        myThirdView.widthAnchor.constraint(equalTo : mySecondView.widthAnchor, multiplier: 1.5).isActive = true
        //추가한 뷰의 width 앵커를 secondview를 참고해 1.5배 시키겠다 .
        myThirdView.heightAnchor.constraint(equalTo : mySecondView.heightAnchor, multiplier: 1.5).isActive = true
        myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 50).isActive = true
        myThirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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
            .previewDisplayName("응애폰")
    }
}


#endif

