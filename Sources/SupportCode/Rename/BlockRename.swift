//
//  BlockRename.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 27.12.2020.
//

import Foundation

/// Пустой блок
public typealias VoidBlock = () -> Void
/// Блок с флагом
public typealias BoolBlock = (Bool) -> Void
/// Блок с числом
public typealias IntBlock = (Int) -> Void
/// Блок со строкой
public typealias StringBlock = (String) -> Void
/// Блок с датой
public typealias DataBlock = (Data) -> Void
/// Блок с Result
public typealias ResultBlock<T> = (Result<T, Error>) -> Void

import class UIKit.UIImage

/// Блок с изображением
public typealias ImageBlock = (UIImage) -> Void
public typealias OptImageBlock = (UIImage?) -> Void
