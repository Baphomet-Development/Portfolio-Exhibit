//
//  IssueRow.swift
//  Portfolio Exhibit
//
//  Created by Jason on 5/16/23.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationLink(value: issue) {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .imageScale(.large)
                        .opacity(issue.priority == 2 ? 1 : 0)
                    
                    VStack(alignment: .leading) {
                        Text(issue.issueTitle)
                            .font(.headline)
                            .lineLimit(1)
                        
                        Text("No tags")
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(issue.issueCreationDate.formatted(date: .numeric, time: .omitted))
                            .font(.subheadline)
                        
                        if issue.completed {
                            Text("CLOSED")
                                .font(.body.smallCaps())
                        }
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct IssueRow_Previews: PreviewProvider {
    static var previews: some View {
        IssueRow(issue: .example)
    }
}
