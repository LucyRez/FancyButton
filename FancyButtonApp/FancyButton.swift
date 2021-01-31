//
//  FancyButton.swift
//  FancyButtonApp
//
//  Created by Ludmila Rezunic on 31.01.2021.
//

import UIKit

@IBDesignable
class FancyButton: UIButton {
    
    @IBInspectable var enableImageRightAlligned: Bool = false // Флаг для изображения справа
    @IBInspectable var enableGradientBackground: Bool = false // Флаг для отображения градиента
    @IBInspectable var gradientColor1: UIColor = .black
    @IBInspectable var gradientColor2: UIColor = .white
    
    // Настраиваем радиус закругления кнопки
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius>0
        }
    }
    
    // Настраиваем толщину границ
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    // Настраиваем цвет границы
    @IBInspectable var borderColor: UIColor = .black {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // Настраиваем объём пространства слева от текста
    @IBInspectable var titleLeftPadding: CGFloat = 0.0 {
        didSet{
            titleEdgeInsets.left = titleLeftPadding
        }
    }
    
    // Настраиваем объём пространства справа от текста
    @IBInspectable var titleRightPadding: CGFloat = 0.0 {
        didSet{
            titleEdgeInsets.right = titleRightPadding
        }
    }
    
    // Настраиваем объём пространства выше текста
    @IBInspectable var titleTopPadding: CGFloat = 0.0 {
        didSet{
            titleEdgeInsets.top = titleTopPadding
        }
    }
    
    // Настраиваем объём пространства ниже текста
    @IBInspectable var titleBottomPadding: CGFloat = 0.0 {
        didSet{
            titleEdgeInsets.bottom = titleBottomPadding
        }
    }
    
    // Настраиваем объём пространства слева от изображения
    @IBInspectable var imageLeftPadding: CGFloat = 0.0 {
        didSet{
            imageEdgeInsets.left = imageLeftPadding
        }
    }
    
    // Настраиваем объём пространства справа от изображения
    @IBInspectable var imageRightPadding: CGFloat = 0.0 {
        didSet{
            imageEdgeInsets.right = imageRightPadding
        }
    }
    
    // Настраиваем объём пространства выше изображения
    @IBInspectable var imageTopPadding: CGFloat = 0.0 {
        didSet{
            imageEdgeInsets.top = imageTopPadding
        }
    }
    
    // Настраиваем объём пространства ниже изображения
    @IBInspectable var imageBottomPadding: CGFloat = 0.0 {
        didSet{
            imageEdgeInsets.bottom = imageBottomPadding
        }
    }
    
    // Здесь настраиваем отображение градиента / отодвигаем текст кнопки вправо
    override func layoutSubviews() {
        super.layoutSubviews()
        if enableImageRightAlligned,
           let imageView = imageView{
            imageEdgeInsets.left = self.bounds.width - imageView.bounds.width - imageRightPadding
        }
        
        if enableGradientBackground{
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [gradientColor1.cgColor, gradientColor2.cgColor]
            gradientLayer.startPoint = CGPoint(x:0.0, y:0.5)
            gradientLayer.endPoint = CGPoint(x:1.0, y:0.5)
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
}
