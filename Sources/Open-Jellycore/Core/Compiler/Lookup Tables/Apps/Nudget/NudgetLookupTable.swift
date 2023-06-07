//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var NudgetFunctions: [String : AnyAction] = [
  "addExpense": Action<AddExpenseParameter>(name: "Submit an Expense", identifier: "com.SawyerBlatz.Nudget.AddExpenseIntent", correctTypedFunction: "addExpense", description: """
                                Add an expense
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "viewSingleInsight": Action<ViewSingleInsightParameter>(name: "View an Insight", identifier: "com.SawyerBlatz.Nudget.ViewSingleInsightIntent", correctTypedFunction: "viewSingleInsight", description: """
                                View an insight
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "viewInsights": Action<ViewInsightsParameter>(name: "View Insights", identifier: "com.SawyerBlatz.Nudget.ViewInsightsIntent", correctTypedFunction: "viewInsights", description: """
                                View your insights for a period of time
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "viewBudgetLeft": Action<ViewBudgetLeftParameter>(name: "View your Budget", identifier: "com.SawyerBlatz.Nudget.ViewBudgetLeftIntent", correctTypedFunction: "viewBudgetLeft", description: """
                                View how much is left in your budget
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}