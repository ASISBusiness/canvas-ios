//
// This file is part of Canvas.
// Copyright (C) 2018-present  Instructure, Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

import Foundation
import Core

public class TestRouter: RouterProtocol {
    public init() {}
    public var calls = [(URLComponents, UIViewController, RouteOptions?)]()
    public var viewControllerCalls = [(UIViewController, UIViewController, RouteOptions?)]()

    public func match(_ url: URLComponents) -> UIViewController? {
        return nil
    }

    public func route(to url: URLComponents, from: UIViewController, options: RouteOptions? = nil) {
        calls.append((url, from, options))
    }

    public func show(_ view: UIViewController, from: UIViewController, options: RouteOptions?) {
        viewControllerCalls.append((view, from, options))
    }

    public func lastRoutedTo(_ route: Route) -> Bool {
        return lastRoutedTo(route.url)
    }

    public func lastRoutedTo(_ url: URL) -> Bool {
        return calls.last?.0 == URLComponents.parse(url)
    }

    public func lastRoutedTo(_ url: URLComponents) -> Bool {
        return calls.last?.0 == url
    }

    public func lastRoutedTo(_ url: URL, withOptions options: RouteOptions?) -> Bool {
        return lastRoutedTo(url) && calls.last?.2 == options
    }
}
