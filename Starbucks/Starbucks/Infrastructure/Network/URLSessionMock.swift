//
//  URLSessionMock.swift
//  Starbucks
//
//  Created by 송태환 on 2022/05/09.
//

import Foundation

protocol URLSessionProtocol {
  func dataTask(
    with request: URLRequest,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
  ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class URLSessionDataTaskMock: URLSessionDataTask {
  private let closure: () -> Void

  init(closure: @escaping () -> Void) {
    self.closure = closure
    super.init()
  }

  override func resume() {
    self.closure()
  }
}

class URLSessionMock: URLSessionProtocol {
  typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

  var data: Data?
  var error: Error?
  var response: HTTPURLResponse?

  init(
    data: Data? = nil,
    response: HTTPURLResponse? = nil,
    error: Error? = nil
  ) {
    self.data = data
    self.response = response
    self.error = error
  }

  func dataTask(
    with _: URLRequest,
    completionHandler: @escaping CompletionHandler
  ) -> URLSessionDataTask {
    let data = self.data
    let error = self.error
    let response = self.response

    return URLSessionDataTaskMock {
      completionHandler(data, response, error)
    }
  }
}
