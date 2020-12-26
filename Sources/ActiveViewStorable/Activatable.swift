//
//  Activatable.swift
//  ActiveViewStorable
//
//  Created by yosshi4486 on 2020/11/24.
//

#if canImport(UIKit) || targetEnvironment(macCatalyst)

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

        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            let activatable = self.cellForRow(at: indexPath) as? Activatable
            activatable?.activate()
        }
    }

    public func deactivateCell(at indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            let activatable = self.cellForRow(at: indexPath) as? Activatable
            activatable?.deactivate()
        }
    }

}

#endif
