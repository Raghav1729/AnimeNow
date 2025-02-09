//
//  DatabaseClient.swift
//  Anime Now!
//
//  Created by ErrorErrorError on 9/3/22.
//

import ComposableArchitecture

// MARK: - DatabaseClient

public protocol DatabaseClient {
    // Insert
    func insert<T: ManagedObjectConvertible>(_ item: T) async throws

    // Update
    @discardableResult
    func update<T: ManagedObjectConvertible, V: ConvertableValue>(
        _ id: T.ID,
        _ keyPath: WritableKeyPath<T, V>,
        _ value: V
    ) async throws -> Bool

    @discardableResult
    func update<T: ManagedObjectConvertible, V: ConvertableValue>(
        _ id: T.ID,
        _ keyPath: WritableKeyPath<T, V?>,
        _ value: V?
    ) async throws -> Bool

    func delete<T: ManagedObjectConvertible>(_ item: T) async throws
    func fetch<T: ManagedObjectConvertible>(_ request: Request<T>) async throws -> [T]
    func observe<T: ManagedObjectConvertible>(_ request: Request<T>) -> AsyncStream<[T]>
}

// MARK: - DatabaseClientKey

public enum DatabaseClientKey: DependencyKey {
    public static let liveValue = DatabaseClientLive.shared as DatabaseClient
}

public extension DependencyValues {
    var databaseClient: DatabaseClient {
        get { self[DatabaseClientKey.self] }
        set { self[DatabaseClientKey.self] = newValue }
    }
}
