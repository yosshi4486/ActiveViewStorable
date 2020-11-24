//
//  ActiveViewStorable.swift
//  ActiveViewStorable
//
//  Created by yosshi4486 on 2020/11/24.
//

#if canImport(UIKit)

import UIKit

/// A pattern for operating active view(firstResponder).
public protocol ActiveViewStorable {

    associatedtype Cell: UITableViewCell

    associatedtype ActiveView: UIView

    /// The view that is firstResponder of current.
    var activeView: ActiveView? { get }

    /// The tableView that can have activeView.
    var tableView: UITableView! { get set }
}

extension ActiveViewStorable {

    /// Returns the cell that have activeView.
    public var cellForActiveView: Cell? {

        var view: UIView? = activeView

        while view != nil {
            if let cell = view as? Cell {
                return cell
            } else {
                view = view?.superview
            }
        }

        return view as? Cell
    }

    /// Returns the indexPath that the associated cell have activeView.
    public var indexPathForActiveView: IndexPath? {

        guard let cell = cellForActiveView else { return nil }

        return tableView?.indexPath(for: cell)
    }

}

extension ActiveViewStorable where Cell: RepresentedView {

    /// Returns the representedObject of activeView.
    var representedObjectOfActiveView: Cell.RepresentedObject? {

        guard let cell = cellForActiveView else { return nil }

        return cell.representedObject
    }

}

#endif
