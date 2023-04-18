//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let subView: UIView = {
    let sub = UIView()
    sub.translatesAutoresizingMaskIntoConstraints = false
    //sub.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 100, height: 50))
    sub.backgroundColor = .purple
    return sub
  }()
  
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    mainView.addSubview(subView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    // purple
    subView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -30).isActive = true
    subView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30).isActive = true
    subView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6).isActive = true
    subView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    // blue
    let vStackView = UIStackView(
      arrangedSubviews: [UIView(), getBlueView(), getBlueView(), getBlueView(), UIView()])
    mainView.addSubview(vStackView)
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.alignment = .center
    vStackView.axis = .vertical
    vStackView.distribution = .equalSpacing
    vStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    vStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    vStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    
    // red
    let redView = UIView()
    mainView.addSubview(redView)
    redView.translatesAutoresizingMaskIntoConstraints = false
    redView.backgroundColor = .red
    redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
    redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
    
    // orange
    let orangeView1 = UIView()
    redView.addSubview(orangeView1)
    orangeView1.translatesAutoresizingMaskIntoConstraints = false
    orangeView1.backgroundColor = .orange
    orangeView1.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.5).isActive = true
    orangeView1.heightAnchor.constraint(equalToConstant: 40).isActive = true
    orangeView1.topAnchor.constraint(equalTo: redView.topAnchor, constant: 5).isActive = true
    orangeView1.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 5).isActive = true
    // orange
    let orangeView2 = UIView()
    redView.addSubview(orangeView2)
    orangeView2.translatesAutoresizingMaskIntoConstraints = false
    orangeView2.backgroundColor = .orange
    orangeView2.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.3).isActive = true
    orangeView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
    orangeView2.topAnchor.constraint(equalTo: redView.topAnchor, constant: 5).isActive = true
    orangeView2.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -5).isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  private func getBlueView() -> UIView {
    let blueView = UIView()
    blueView.translatesAutoresizingMaskIntoConstraints = false
    blueView.backgroundColor = .blue
    blueView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return blueView
  }
}

