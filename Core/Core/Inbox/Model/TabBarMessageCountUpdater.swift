//
// This file is part of Canvas.
// Copyright (C) 2022-present  Instructure, Inc.
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

public class TabBarMessageCountUpdater {

    public init() {
    }

    public func updateBadgeCount(oldState: ConversationWorkflowState,
                                 newState: ConversationWorkflowState) {
        var messageCount = TabBarBadgeCounts.unreadMessageCount

        if newState == .unread {
            messageCount += 1
        } else if oldState == .unread, messageCount > 0 {
            messageCount -= 1
        }

        TabBarBadgeCounts.unreadMessageCount = messageCount
    }
}