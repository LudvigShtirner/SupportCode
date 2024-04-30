//
//  CGSize+Math.swift
//  
//
//  Created by Алексей Филиппов on 04.08.2022.
//

// Apple
import CoreGraphics

public extension CGSize {
    /// Рассчитать размер вписанного прямоугольника
    /// - Parameter aspectRatio: Соотношение ширины к высоте вписанного прямоугольника. Не должен равняться *nan*, *zero*, *infinity*, *subnormal*
    /// - Returns: Размер вписанного прямоугольника с указанным соотношением сторон
    func sizeInside(with aspectRatio: CGFloat) -> CGSize {
        if !aspectRatio.isNormal {
            return CGSize.nan
        }
        let insideWidth = min(height * aspectRatio, width)
        let insideHeight = min(width / aspectRatio, height)
        return CGSize(width: insideWidth,
                      height: insideHeight)
    }
    
    /// Рассчитать размер описанного прямоугольника
    /// - Parameter aspectRatio: Соотношение ширины к высоте описанного прямоугольника. Не должен равняться *nan*, *zero*, *infinity*, *subnormal*
    /// - Returns: Размер описанного прямоугольника с указанным соотношением сторон
    func sizeOutside(with aspectRatio: CGFloat) -> CGSize {
        if !aspectRatio.isNormal {
            return CGSize.nan
        }
        let outsideWidth = max(height * aspectRatio, width)
        let outsideHeight = max(width / aspectRatio, height)
        return CGSize(width: outsideWidth,
                      height: outsideHeight)
    }
    
    /// Соотношение ширины к высоте
    var aspectRatio: CGFloat {
        if !width.isNormal {  return CGFloat.nan }
        if !height.isNormal { return CGFloat.nan }
        return width / height
    }
    
    var diagonal: CGFloat {
        CGPoint.zero.distance(to: CGPoint(x: width, y: height))
    }
    
    /// Увеличить размер на указанный мультипликатор
    /// - Parameter scale: мультипликатор размера исходного прямоугольника
    func scaled(scale: CGFloat) -> CGSize {
        return CGSize(width: width * scale,
                      height: height * scale)
    }
    
    /// Возвращает минимальную сторону
    var minSide: CGFloat { min(width, height) }
    /// Возвращает максимальную сторону
    var maxSide: CGFloat { max(width, height) }
    
    /// Округлить размеры сторон
    /// - Returns: размер с целыми значениями
    func rounded() -> CGSize {
        CGSize(width: round(width),
               height: round(height))
    }
    
    var abs: CGSize {
        CGSize(width: Swift.abs(width),
               height: Swift.abs(height))
    }
}
