//
//  LoginView.swift
//  TQIHub
//
//  Created by Victor Alves de Freitas on 18/09/22.
//

import UIKit
import UICodeKit

class LoginView: BaseView {
    
    // MARK: Actions
    
    var loginTapped: (() -> Void)?
    
    // MARK: Properties
    
    lazy var titleLabel = UILabel() .. {
        $0.text = "TQIHub"
        $0.font = .systemFont(ofSize: 38, weight: .heavy)
    }
    
    lazy var usernameTextField = UITextField() .. {
        $0.placeholder = "Usuário"
        $0.borderStyle = .roundedRect
        $0.height(40)
    }
    
    lazy var passwordTextField = UITextField() .. {
        $0.placeholder = "Senha"
        $0.isSecureTextEntry = true
        $0.borderStyle = .roundedRect
        $0.height(40)
    }
    
    lazy var enterButton = UIButton() .. {
        $0.setTitle("Entrar", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.layer.cornerRadius = 24
        $0.height(48)
        
        $0.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
    }
    
    lazy var forgotButton = UIButton() .. {
        $0.setTitle("Esqueci minha senha", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 24
        $0.height(48)
    }
    
    // MARK: Body
    
    override func body() -> UICodeView? {
        UIScroll {
            UIStack(axis: .vertical) {
                Wrapper(titleLabel, position: .centerX)
                UIStack(axis: .vertical) {
                    usernameTextField
                    passwordTextField
                }.padding(.bottom(18))
                enterButton
                forgotButton
                UISpacer()
            }
            .padding(.top(24), .horizontal(16))
        }
    }
    
    @objc func continueTapped() {
        loginTapped?()
    }
}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LoginController().toPreview()
//        }
//        .previewDevice("iPhone 12")
//
//        Group {
//            LoginController().toPreview()
//        }
//        .previewDevice("iPhone SE (2nd generation)")
//    }
//}
