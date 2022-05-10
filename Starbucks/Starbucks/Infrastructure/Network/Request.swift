//
//  Request.swift
//  Starbucks
//
//  Created by 송태환 on 2022/05/09.
//

import Foundation

enum HTTPMethodType: String {
  case head = "HEAD"
  case option = "OPTIONS"
  case get = "GET"
  case put = "PUT"
  case post = "POST"
  case patch = "PATCH"
  case delete = "DELETE"
}

struct Request {
  var method: HTTPMethodType
  var path: String
  var query: [String: Any]?
  var body: [String: Any]?

  private init(method: HTTPMethodType, path: String, query: [String: Any]? = nil, body: [String: Any]? = nil) {
    self.method = method
    self.path = path
    self.query = query
    self.body = body
  }
}

extension Request {
  static func head(path: String, query: [String: Any]? = nil) -> Request {
    Request(method: .head, path: path, query: query)
  }

  static func option(path: String, query: [String: Any]? = nil) -> Request {
    Request(method: .option, path: path, query: query)
  }

  static func get(path: String, query: [String: Any]? = nil) -> Request {
    Request(method: .get, path: path, query: query)
  }

  static func post(path: String, query: [String: Any]? = nil, body: [String: Any]? = nil) -> Request {
    Request(method: .put, path: path, query: query, body: body)
  }

  static func put(path: String, query: [String: Any]? = nil, body: [String: Any]? = nil) -> Request {
    Request(method: .put, path: path, query: query, body: body)
  }

  static func delete(path: String, query: [String: Any]? = nil, body: [String: Any]? = nil) -> Request {
    Request(method: .delete, path: path, query: query, body: body)
  }

  static func patch(path: String, query: [String: Any]? = nil, body: [String: Any]? = nil) -> Request {
    Request(method: .patch, path: path, query: query, body: body)
  }
}

// API Clint 의 configuration
// Service(config).request(Request.get())
struct NetworkConfiguration {
  let baseURL: URL
  let headers: [String: String]
  let query: [String: String]

  init(baseURL: URL, headers: [String: String] = [:], query: [String: String] = [:]) {
    self.baseURL = baseURL
    self.headers = headers
    self.query = query
  }
}

// Repository -> Service -> (request->URL) -> URLSession(Manager)
