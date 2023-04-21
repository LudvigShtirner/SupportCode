//
//  NSRelationDescription+CodeGeneration.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 12.04.2021.
//

// Apple
import CoreData

/// Расширение для удобного создания связи моделей
public extension NSRelationshipDescription {
    /// Создать сущности связи моделей
    /// - Parameters:
    ///   - description: Описание связи с моделью
    ///   - entity: связываемая модель
    convenience init(description: RelationDescription,
                     entity: NSEntityDescription) {
        self.init()
        self.name = description.property
        self.destinationEntity = entity
        self.deleteRule = description.deleteRule
        self.isOptional = description.isOptional
        switch description.type {
        case .toOne:
            self.minCount = 0
            self.maxCount = 1
        case .toMany:
            self.minCount = 0
            self.maxCount = 0
        case .toManyMinOne:
            self.minCount = 1
            self.maxCount = 0
        }
    }
    
    /// Описание связи с моделью
    struct RelationDescription {
        /// Название поля
        let property: String
        /// Правило удаления
        let deleteRule: NSDeleteRule
        /// Тип связывания сущностей базы данных
        let type: NSRelationshipDescription.LinkType
        /// Флаг опционально значения
        let isOptional: Bool
        
        // MARK: - Inits
        /// Создать описание связи с моделью
        /// - Parameters:
        ///   - property: название поля
        ///   - deleteRule: тип удаления связи
        ///   - type: тип связи
        ///   - isOptional: флаг возможности отсутствия значения. Если не указан, то значение является обязательным
        public init(property: String,
                    deleteRule: NSDeleteRule,
                    type: NSRelationshipDescription.LinkType,
                    isOptional: Bool = false) {
            self.property = property
            self.deleteRule = deleteRule
            self.type = type
            self.isOptional = isOptional
        }
    }
    
    /// Тип связывания сущностей базы данных
    enum LinkType {
        /// Связь один к одному
        case toOne
        /// Связь один к многим
        case toMany
        /// Связь один к многим, но минимум одно значение
        case toManyMinOne
    }
}
