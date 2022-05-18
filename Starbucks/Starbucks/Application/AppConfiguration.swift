//
//  AppConfiguration.swift
//  Starbucks
//
//  Created by 송태환 on 2022/05/09.
//

import Foundation

enum AppConfiguration {
  private static let starbucksURL = "starbucksApiURL"
  private static let serverURL = "serverApiURL"
  private static let networkScheme = "https://"

  enum Error: Swift.Error {
    case missingKey
    case invalidValue
  }

  static func value(for key: String) throws -> String {
    guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
      throw Error.missingKey
    }

    guard let object = object as? String else {
      throw Error.invalidValue
    }

    return object
  }

  static let serverApiURL: URL = {
    guard let url = try? URL(string: networkScheme + value(for: starbucksURL)) else {
      fatalError()
    }

    return url
  }()

  static let starbucksApiURL: URL = {
    guard let url = try? URL(string: networkScheme + value(for: starbucksURL)) else {
      fatalError()
    }

    return url
  }()
}
