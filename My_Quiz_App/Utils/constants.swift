
//
//  Constant.swift
//  Carrera
//
//  Created by Asim on 30/08/2021.
//

import SwiftUI
import Foundation
import UIKit


let dummyImageUrl = "https://discovercentraltexas.org/wp-content/uploads/2022/03/image-coming-soon.jpg"



// MARK: COLOR
//let appColor: Color = Color("AccentColor")

// MARK: COLOR...


// MARK: Device Width & Height
let deviceHeight = UIScreen.main.bounds.height
let deviceWidth  = UIScreen.main.bounds.width
let smallDeviceTopPadding: CGFloat  = deviceHeight < 750 ? 0: -50


let authScreenLogoWidth : Double = 200
let authScreenLogoHeight : Double = 170

let textFieldMaxHeight: CGFloat  = 60
let textFieldMinHeight: CGFloat  = 50
let messageTextFiledHeight: CGFloat  = 120

let imageCorner: CGFloat = 12.0

//

struct IconSize {
    static let small: CGFloat = 20.0
//    static let small: CGFloat = 32.0

}

let btnHeight: CGFloat = 54.0

// MARK: LAYOUT

let columnSpacing: CGFloat = 4
let rowSpacing: CGFloat = 4
let spacing: CGFloat = 8

//let cornerRadius: CGFloat = 10.0

var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
}

let buttonCornerRadius: CGFloat = 3.0
let btnCorder: CGFloat = 25.0
let toolBarPading: CGFloat = 25
let shadow: Int = 5
let textFieldBorder: CGFloat = 0.5


struct AppColors {
    
    static let accent: Color = Color("AccentColor")

    static let appBlue: Color = Color("Blue")
    static let normalTextColor: Color = Color("normalTextColor")
    let previeusDaysColor: Color = Color("previeusDaysColor")
    static let bordercolor : Color = Color("borderclr")

}



// Shadow
struct CustomShadow {
    
  

    static let small: CGFloat = 2
    static let regular: CGFloat = 8
    static let medium: CGFloat = 12
    
}

// FONT
struct CustomFontsSize {
  static let exxSmall: CGFloat = 8
  static let exSmall: CGFloat = 12
  static let small: CGFloat = deviceHeight < 700 ? 10 : 16
  static let regular: CGFloat = deviceHeight < 700 ? 12 : 18
  static let medium: CGFloat = deviceHeight < 700 ? 14 : 24
  static let large: CGFloat = 34
}

// Padding
struct CustomPadding {
    
    static let exxSmall: CGFloat = 8

    static let exSmall: CGFloat = 12

    static let small: CGFloat = 16
    static let regular: CGFloat = 18
    static let medium: CGFloat = 24
    static let large: CGFloat = 34
    static let bottomTabs: CGFloat = 34

    
}

let topBottomCornerRadius: CGFloat = 12.0

// CornerRadius
struct CustomCornerRadius {
    
    static let exxSmall: CGFloat = 8

    static let exSmall: CGFloat = 12

    static let small: CGFloat = 16
    static let regular: CGFloat = 18
    static let medium: CGFloat = 24
    static let large: CGFloat = 34
    
    
}




//let screenHeight: CGFloat = UIScreen.main.bounds.height
//let screenWidth: CGFloat = UIScreen.main.bounds.width
//



///

// MARK: Progress Dialog

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

// MARK: Loading View...............

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    Text("Please wait...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
    
}
//...........................................................................................

// MARK: Email Validation............
func textFieldValidatorEmail(_ string: String) -> Bool {
    if string.count > 100 {
        return false
    }
    let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: string)
}
//...........................................................................................

// MARK: IMAGE SIZE REDUCING CODE............
extension UIImage {
    func aspectFittedToHeight(_ newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }}
}

func compressImage(image: UIImage) -> UIImage {
    let resizedImage = image.aspectFittedToHeight(80)
    resizedImage.jpegData(compressionQuality: 1.0)
    return resizedImage
}


// MARK: UserDefault Key
struct UserDefaultKey {
    static let loginStatus = "Login Status"
    static let savedUser = "Saved User"
    static let savedUserType = "savedUserType"
    static let savedChecked = "SavedChecked"
    
    static let savedToken = "FcmToken"
    
}
//...........................................................................................



//...........................................................................................

// MARK: Custom Rounded Corners..........
struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//step 2 - embed shape in viewModifier to help use with ease
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}


// Image-To-Base64-Convertor.............
func convertImageToBase64(_ image: UIImage) -> String {
    
    
    let imageData:NSData = image.pngData()! as NSData
    
    // Image to Base64:
    let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
    
    return strBase64
}



enum Side: Equatable, Hashable {
    case left
    case right
}

extension View {
    func padding(sides: [Side], value: CGFloat = 8) -> some View {
        HStack(spacing: 0) {
            if sides.contains(.left) {
                Spacer().frame(width: value)
            }
            self
            if sides.contains(.right) {
                Spacer().frame(width: value)
            }
        }
    }
}

//...........................................................................................
