//
//  Managed.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 28.02.2021.
//

// Apple
import CoreData

/**
 Protocol of CoreData object
 
 - RU:
 
 Протокол объекта CoreData
 */
public protocol Managed: NSFetchRequestResult {
    /// Название сущности CoreData
    static var entityName: String { get }
    /// Описание сортировки
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
}

// MARK: - Managed extension
public extension Managed {
    /// Описание сортировки
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }
    /// Запрос на получение отсортированной информации
    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
}

// MARK: - NSManagedObject
public extension Managed where Self: NSManagedObject {
    /// Название сущности
    static var entityName: String { entity().name! }
    
    /// Найти объект, удовлетворяющий предикату, или создать новый
    /// - Parameters:
    ///   - context: контекст базы данных
    ///   - predicate: Предикат для поиска нужного значения
    /// - Returns: объект сущности
    static func findOrCreate(in context: NSManagedObjectContext,
                             matching predicate: NSPredicate) -> Self {
        guard let object = findOrFetch(in: context, matching: predicate) else {
            let newObject: Self = context.insertObject()
            return newObject
        }
        return object
    }
    
    /// Найти объект, удовлетворяющий предикату
    /// - Parameters: 
    ///   - context: контекст базы данных
    ///   - predicate: Предикат для поиска нужного значения
    /// - Returns: объект, удовлетворяющий предикату
    static func findOrFetch(in context: NSManagedObjectContext,
                            matching predicate: NSPredicate) -> Self? {
        guard let object = materializedObject(in: context, matching: predicate) else {
            return fetch(in: context) { request in
                request.predicate = predicate
                request.returnsObjectsAsFaults = false
                request.fetchLimit = 1
            }.first
        }
        return object
    }
    
    /// Найти объект в помеченных для действия значениях
    /// - Parameters:
    ///   - context: контекст базы данных
    ///   - predicate: Предикат для поиска нужного значения
    /// - Returns: Объект базы данных, соответствующий предикату
    static func materializedObject(in context: NSManagedObjectContext,
                                   matching predicate: NSPredicate) -> Self? {
        for object in context.registeredObjects where !object.isFault {
            guard let result = object as? Self,
                  predicate.evaluate(with: result) else {
                continue
            }
            return result
        }
        return nil
    }
    
    /// Запросить объекты из CoreData, удовлетворяющие запросу
    /// - Parameters:
    ///   - context: контекст базы данных
    ///   - configurationBlock: блок настройки запроса
    /// - Returns: объекты из CoreData, удовлетворяющие запросу
    static func fetch(in context: NSManagedObjectContext,
                      configurationBlock: (NSFetchRequest<Self>) -> Void = { _ in }) -> [Self] {
        let request = NSFetchRequest<Self>(entityName: Self.entityName)
        configurationBlock(request)
        // swiftlint:disable all
        return try! context.fetch(request)
        // swiftlint:enable all
    }
}

// MARK: - NSManagedObjectContext
public extension NSManagedObjectContext {
    /// Добавить новый объект сущности
    /// - Returns: Созданный объект
    func insertObject<A: NSManagedObject>() -> A where A: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A else {
            fatalError("Wrong object type")
        }
        return obj
    }
    
    /// Попробовать сохранить изменения
    /// - Returns: Ничего в случае успеха и ошибку, если сохранить не удалось
    @discardableResult
    func saveOrRollback() -> Result<Void, Error> {
        if !hasChanges { return .success }
        do {
            try save()
            return .success
        } catch {
            rollback()
            return .failure(error)
        }
    }
    
    /// Применить изменения
    /// - Parameter block: блок изменений
    /// - Parameter completion: блок по окончанию сохранения изменений. Если изменения не были сохранены, то содержит ошибку
    func performChangesAsync(block: @escaping () -> Void,
                             completion: ResultBlock<Void>? = nil) {
        perform {
            block()
            let result = self.saveOrRollback()
            completion?(result)
        }
    }
    
    @discardableResult
    func performChanges(block: @escaping () -> Void) -> Result<Void, Error> {
        var result: Result<Void, Error> = .success
        performAndWait {
            block()
            result = self.saveOrRollback()
        }
        return result
    }
}
