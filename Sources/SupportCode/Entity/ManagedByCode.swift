//
//  ManagedByCode.swift
//  
//
//  Created by Алексей Филиппов on 04.02.2023.
//

// Apple
import CoreData

/**
 Protocol of CoreData Object, configured in code
 
 - RU:
 
 Протокол объекта CoreData, сконфигурированного через код
 */
public protocol ManagedByCode: Managed {
    /// Описание сущности Core Data
    static var entityDescription: NSEntityDescription { get }
}

public extension ManagedByCode where Self: NSManagedObject {
    /// Название сущности
    static var entityName: String { entityDescription.name! }
}
