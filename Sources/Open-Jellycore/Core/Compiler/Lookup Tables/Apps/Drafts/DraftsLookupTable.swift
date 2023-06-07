//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var DraftsFunctions: [String : AnyAction] = [
  "runActionOnDraft": Action<RunActionOnDraftParameter>(name: "Run Action on Draft", identifier: "com.agiletortoise.Drafts5.RunActionOnDraftIntent", correctTypedFunction: "runActionOnDraft", description: """
                                Run action in Drafts using specified draft
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "loWoradWorkspace": Action<LoWoradWorkspaceParameter>(name: "Open Workspace", identifier: "com.agiletortoise.Drafts5.LoadWorkspaceIntent", correctTypedFunction: "loWoradWorkspace", description: """
                                Open Drafts and apply workspace
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "processTemplate": Action<ProcessTemplateParameter>(name: "Process Template", identifier: "com.agiletortoise.Drafts5.ProcessTemplateIntent", correctTypedFunction: "processTemplate", description: """
                                Pass text through Drafts template engine
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "queryWorkspace": Action<QueryWorkspaceParameter>(name: "Get Drafts from Workspace", identifier: "com.agiletortoise.Drafts5.QueryWorkspaceIntent", correctTypedFunction: "queryWorkspace", description: """
                                Retrieve drafts matching the filters of a workspace
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "showCapture": Action<ShowCaptureParameter>(name: "Show Capture", identifier: "com.agiletortoise.Drafts5.ShowCaptureIntent", correctTypedFunction: "showCapture", description: """
                                Show draft capture window
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setDraft": Action<SetDraftParameter>(name: "Update Draft", identifier: "com.agiletortoise.Drafts5.SetDraftIntent", correctTypedFunction: "setDraft", description: """
                                Update content and values of an existing draft
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getDraftByUUID": Action<GetDraftByUUIDParameter>(name: "Get Draft with UUID", identifier: "com.agiletortoise.Drafts5.GetDraftByUUIDIntent", correctTypedFunction: "getDraftByUUID", description: """
                                Retreive an existing draft using a unique identifier
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getCurrentDraft": Action<GetCurrentDraftParameter>(name: "Get Current Draft", identifier: "com.agiletortoise.Drafts5.GetCurrentDraftIntent", correctTypedFunction: "getCurrentDraft", description: """
                                Retrieve active draft from editor
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openDraft": Action<OpenDraftParameter>(name: "Open Draft", identifier: "com.agiletortoise.Drafts5.OpenDraftIntent", correctTypedFunction: "openDraft", description: """
                                Open a draft in Drafts
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "dictateDraft": Action<DictateDraftParameter>(name: "Create Draft with Dictation", identifier: "com.agiletortoise.Drafts5.DictateDraftIntent", correctTypedFunction: "dictateDraft", description: """
                                Create new draft via dictation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getDraft": Action<GetDraftParameter>(name: "Get Draft", identifier: "com.agiletortoise.Drafts5.GetDraftIntent", correctTypedFunction: "getDraft", description: """
                                Retrieve an existing draft
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "fileDraft": Action<FileDraftParameter>(name: "File Draft", identifier: "com.agiletortoise.Drafts5.FileDraftIntent", correctTypedFunction: "fileDraft", description: """
                                Update draft folder and values without updating content
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "runAction": Action<RunActionParameter>(name: "Run Action with Text", identifier: "com.agiletortoise.Drafts5.RunActionIntent", correctTypedFunction: "runAction", description: """
                                Run action in Drafts using provided text
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "capture": Action<CaptureParameter>(name: "Create Draft", identifier: "com.agiletortoise.Drafts5.CaptureIntent", correctTypedFunction: "capture", description: """
                                Capture text as new draft
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "markdownToHTML": Action<MarkdownToHTMLParameter>(name: "Markdown To HTML", identifier: "com.agiletortoise.Drafts5.MarkdownToHTMLIntent", correctTypedFunction: "markdownToHTML", description: """
                                Markdown to HTML
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "queryDrafts": Action<QueryDraftsParameter>(name: "Search Drafts", identifier: "com.agiletortoise.Drafts5.QueryDraftsIntent", correctTypedFunction: "queryDrafts", description: """
                                Run a search and return matching drafts
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "viewDraft": Action<ViewDraftParameter>(name: "View Draft", identifier: "com.agiletortoise.Drafts5.ViewDraftIntent", correctTypedFunction: "viewDraft", description: """
                                View content of a draft
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}