//
//  NSEntityDescription+CodeGeneration.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 02.04.2021.
//

// Apple
import CoreData

/// Расширение для удобного создания описания модели и её наполнения
public extension NSEntityDescription {
    /// Создать описание сущности базы данных
    /// - Parameter classType: класс сущности базы данных
    convenience init(from classType: AnyClass) {
        self.init()
        self.name = String(describing: classType)
        self.managedObjectClassName = String(describing: classType)
    }
    
    /// Добавить поле в сущность базы данных
    /// - Parameter property: описание поля
    func addProperty(_ property: NSPropertyDescription) {
        self.properties.append(property)
    }
    
    /// Связать с другой сущностью базы данных
    /// - Parameters:
    ///   - entity: Описание сущности базы данных
    ///   - description: Модель описания связи
    ///   - inverseDescription: Модель описания обратной связи
    func link(with entity: NSEntityDescription,
              description: NSRelationshipDescription.RelationDescription,
              inverseDescription: NSRelationshipDescription.RelationDescription) {
        let parentRelation = NSRelationshipDescription(description: description,
                                                       entity: entity)
        let childRelation = NSRelationshipDescription(description: inverseDescription,
                                                      entity: self)
        childRelation.inverseRelationship = parentRelation
        parentRelation.inverseRelationship = childRelation

        self.addProperty(parentRelation)
        entity.addProperty(childRelation)
    }
}

/// Расширение для удобного создания описания поля модели
public extension NSAttributeDescription {
    /// Создать описание поля сущности базы данных
    /// - Parameters:
    ///   - name: название поля
    ///   - ofType: тип поля
    ///   - isOptional: флаг возможности отсутствия значения
    convenience init(name: String,
                     ofType: NSAttributeType,
                     isOptional: Bool = false) {
        self.init()
        self.name = name
        self.attributeType = ofType
        self.isOptional = isOptional
    }
}
