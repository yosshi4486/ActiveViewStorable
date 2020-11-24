//
//  Activatable.swift
//  ActiveViewStorable
//
//  Created by yosshi4486 on 2020/11/24.
//

#if canImport(UIKit)

import UIKit

/// A type that can activate.
public protocol Activatable {

    /// Execute activation
    func activate()

    /// Execute deactivation
    func deactivate()

}

extension UITableView {

    public func activateCell(at indexPath: IndexPath) {

        scrollToRow(at: indexPath, at: .bottom, animated: true)

        let activatable = cellForRow(at: indexPath) as? Activatable
        activatable?.activate()
    }

    public func deactivateCell(at indexPath: IndexPath) {
        let activatable = cellForRow(at: indexPath) as? Activatable
        activatable?.deactivate()
    }

}

#endif
