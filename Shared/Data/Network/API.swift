//
//  API.swift
//  Anime Now!
//
//  Created by ErrorErrorError on 9/4/22.
//

import Foundation
import URLRouting
import Combine

protocol APIRoutable {
    associatedtype Endpoint
    var baseURL: URL { get }
    var router: AnyParserPrinter<URLRequestData, Endpoint> { get }
    func configureRequest(request: inout URLRequest)
}

extension APIRoutable {
    func configureRequest(_ request: inout URLRequest) {
        configureRequest(request: &request)
        let userAgent = Self.userAgent()
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
    }
 }

extension APIRoutable {
    static func userAgent() -> String {
        let info = Bundle.main.infoDictionary
        let executable = info?[kCFBundleNameKey as String] ?? "Unknown"
        let bundle = info?[kCFBundleIdentifierKey as String] ?? "Unknown"
        let appVersion = info?["CFBundleShortVersionString"] ?? "Unknown"
        let appCommit = info?["Commit Version"] ?? "Unknown"
        let osVersion = {
            let version = ProcessInfo.processInfo.operatingSystemVersion
            return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
        }()
        let osName = {
            #if os(iOS)
            #if targetEnvironment(macCatalyst)
            return "macOS(Catalyst)"
            #else
            return "iOS"
            #endif
            #elseif os(watchOS)
            return "watchOS"
            #elseif os(tvOS)
            return "tvOS"
            #elseif os(macOS)
            return "macOS"
            #else
            return "Unknown"
            #endif
        }()

        return "\(executable)/\(appVersion) (\(bundle); commit:\(appCommit)) \(osName) \(osVersion)"
    }
}

enum API {
    static func request<API: APIRoutable, Output>(
        _ api: API,
        _ endpoint: API.Endpoint,
        _ responseType: Output.Type = Output.self,
        _ decoder: JSONDecoder = .init()
    ) async throws -> Output where Output: Decodable {
        guard var request = try? api.router.baseURL(api.baseURL.absoluteString).request(for: endpoint) else {
            throw URLError(.badURL)
        }

        api.configureRequest(&request)

        let (data, _) = try await URLSession.shared.data(for: request)

        return try decoder.decode(Output.self, from: data)
    }

    static func request<API: APIRoutable>(
        _ api: API,
        _ endpoint: API.Endpoint
    ) async throws -> Void {
        guard var request = try? api.router.baseURL(api.baseURL.absoluteString).request(for: endpoint) else {
            throw URLError(.badURL)
        }

        api.configureRequest(request: &request)

        let (_, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return ()
    }
}

extension URLSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if #available(iOS 15, macOS 12.0, *) {
           return try await self.data(for: request, delegate: nil)
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                let task = self.dataTask(with: request) { data, response, error in
                    guard let data = data, let response = response else {
                        let error = error ?? URLError(.badServerResponse)
                        return continuation.resume(throwing: error)
                    }

                    continuation.resume(returning: (data, response))
                }

                task.resume()
            }
        }
    }

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if #available(iOS 15, macOS 12.0, *) {
           return try await self.data(from: url, delegate: nil)
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                let task = self.dataTask(with: url) { data, response, error in
                    guard let data = data, let response = response else {
                        let error = error ?? URLError(.badServerResponse)
                        return continuation.resume(throwing: error)
                    }

                    continuation.resume(returning: (data, response))
                }

                task.resume()
            }
        }
    }
}
