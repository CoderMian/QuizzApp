//
//  FontManager.swift
//  Cancel_Final
//
//  Created by devsaar on 01/07/2022.
//

import Foundation
//
// FontManager.swift
// CancelTyranny
//
// Created by devSaar on 24/06/2022.
//
import Foundation
import SwiftUI
enum Popins {
  case bold
  case semibold
  case medium
  case regular
  case black
  func font(size: CGFloat) -> Font {
    switch self {
    case .medium:  return .custom("Poppins-Medium", size: size)
    case .semibold: return .custom("Poppins-SemiBold", size: size)
    case .regular: return .custom("Poppins-Regular", size: size)
    case .bold :  return .custom("Poppins-Bold", size: size)
    case .black :  return .custom("Poppins-Black", size: size)
    }
  }
}
enum Urbanist {
  case bold
  case semibold
  case medium
  case regular
  func font(size: CGFloat) -> Font {
    switch self {
    case .medium:
      return .custom("Urbanist-Medium", size: size)
    case .semibold: return .custom("Urbanist-SemiBold", size: size)
    case .regular: return .custom("Urbanist-Regular", size: size)
    case .bold : return .custom("Urbanist-Bold", size: size)
    }
  }
}
enum digital7 {
  case normal
//  case semibold
//  case medium
//  case regular
  func font(size: CGFloat) -> Font {
    switch self {
//    case .medium:
//      return .custom("Urbanist-Medium", size: size)
//    case .semibold: return .custom("Urbanist-SemiBold", size: size)
//    case .regular: return .custom("Urbanist-Regular", size: size)
    case .normal : return .custom("digital-7", size: size)
    }
  }
}
