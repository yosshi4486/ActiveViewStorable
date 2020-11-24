//
//  RepresentedView.swift
//  ActiveViewStorable
//
//  Created by yosshi4486 on 2020/11/24.
//

import UIKit

/// A view should have a represented object in the properties.
///
/// Inspired by AppKit.
public protocol RepresentedView: UIView {

    associatedtype RepresentedObject

    /// The object that this view is representing.
    var representedObject: RepresentedObject? { get set }
}
