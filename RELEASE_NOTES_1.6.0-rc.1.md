# GitHub Copilot for JetBrains — v1.6.0-rc.1 Release Notes

## New Features

### Agent Mode
- **Custom Agent GA** — Custom agents are now generally available. (#7988)
- **Sub-agent GA** — Sub-agent support is now generally available. (#7986)
- **Auto-approve for tools** — Added the ability to auto-approve tool invocations in agent mode. (#7999)
- **Auto-approve for terminal commands** — Added configurable auto-approve rules for terminal commands. (#7930)
- **Auto-approve for sensitive files** — Added "always allow" support for sensitive file access with configurable patterns. (#7960)
- **Auto-approve for edits** — Fixed and refined behavior for the Edits auto-approve feature. (#8031)

### Chat
- **Conversation compression** — Added transcript directory configuration and conversation compression support with a context usage pie chart to visualize token usage and a manual compress button. (#7849)
- **Thinking panel improvements** — Renamed thinking panel title to display the LLM name, and improved auto-scroll, code block styling, and rendering within the thinking panel. (#7891, #8117, #8000, #8291)
- **Anthropic thinking budget settings** — Added a settings option to configure the thinking budget for Anthropic models. (#7863)
- **Adaptive chat panel UI** — The chat panel now adapts gracefully to narrow/constrained widths with proper truncation and clipping. (#7791)

### Customization & Instructions
- **AGENTS.md and CLAUDE.md support** — Added support for `AGENTS.md` and `CLAUDE.md` instruction files alongside existing customization options. (#7319)

### Authentication & Account
- **Improved GHE login flow** — Enhanced the login experience for GitHub Enterprise users. (#8007)
- **GitHub username in status bar** — The Copilot status bar item now displays the signed-in GitHub username. (#8122)
- **`JETBRAINS_COPILOT_LOGIN` environment variable** — Set `JETBRAINS_COPILOT_LOGIN=DeviceCode` to force device code flow login (useful for environments without a browser). (#7976)

### Code Completions
- **Custom completion provider** — Switched to a custom inline completion provider with improved trigger behavior. (#6860)

### Platform
- **Windows ARM64 support** — Added native Copilot Language Server binary for Windows ARM64 architecture. (#7851)
- **Edit mode deprecated** — Edit mode is now marked as deprecated in the chat mode dropdown. (#8131, #8141)

## Bug Fixes

### UI Freeze / Performance
- **Fix UI freeze in DebouncedModuleNotificationService** — Replaced blocking `runReadAction` with cancellable `ReadAction.nonBlocking` to prevent UI freezes. (#8253)
- **Fix UI freeze in MarkdownPane code blocks** — Deferred `CodeBlockPanel` addition and eliminated redundant 300ms throttle to prevent EDT freezes during streaming. (#7978, #8092)
- **Fix UI freeze in createRoundedCodeBlock** — Narrowed the `runReadAction` scope so EditorTextField creation no longer holds the read lock. (#8218)
- **Fix UI freeze in DiffBlock** — Moved `addNewLine` and `deleteLineAt` operations off the EDT. (#8210)
- **Fix UI freeze when changing IDE theme** — Prevented potential freeze in MarkdownPane during theme changes. (#7953)
- **Fix slow operations on EDT in TestFailuresProjectService** — Replaced `runOnEdtAndWait` with `runReadAction` for PSI operations. (#7995)
- **Remove blocking RPC calls on EDT** — Eliminated blocking RPC calls that could freeze the UI. (#8026)
- **Use non-blocking read** — Switched to non-blocking read actions in additional locations. (#8327)

### Chat Panel
- **Fix chat scroller flickering** — Resolved flickering in the chat scroll view and added HiDPI UI scaling support. (#8289)
- **Fix blank chat panel** — Caught `NoClassDefFoundError` in `RunInTerminalRenderer` when the Terminal plugin is unavailable. (#8006)
- **Fix IDE cannot close when chat panel is open** — Resolved a bug preventing IDE shutdown. (#8001)
- **Fix streaming content cutoff** — Added a flush mechanism to ensure final streaming content is always rendered. (#8064, #8065)
- **Fix code block content cut during streaming** — Fixed code block content truncation during active streaming. (#7951)
- **Fix markdown code block rendering** — Fixed corrupted code block content caused by offset misalignment from text trimming. (#8035)
- **Fix code block render in thinking panel** — Corrected rendering of code blocks inside the thinking panel. (#8291)
- **Fix empty thinking panel and duplicate title request** — Resolved edge cases causing blank thinking panels. (#8072)
- **Make code block content non-editable** — Code blocks in tool call rendering are now read-only. (#8332)
- **Fix underscore escape in JBOptionButton** — Corrected rendering of underscores in option buttons. (#8290)
- **Revert empty block filter** — Reverted a filter that was breaking markdown rendering. (#8284)
- **Fix icon button render loop** — Stopped infinite re-render of icon buttons. (#8082)
- **Fix Edit mode label truncation** — Sized combo box to full displayed text to prevent label clipping. (#8340)

### Agent Mode
- **Fix agent mode disable** — Disabling agent mode now correctly disables custom agents as well. (#8149, #8084)
- **Fix tools not re-registered on IDE restart** — Tools are now properly re-registered when re-enabling agent mode after an IDE restart. (#8091)
- **Fix custom agent model issue** — Resolved a model selection issue with custom agents. (#8124)
- **Fix duplicate auto-approve rules** — Prevented adding duplicate rules in terminal/edit auto-approve configuration; handles empty strings. (#8298)
- **Move trust annotation config** — Relocated trust annotation config to the MCP auto-approve section. (#8295)

### Context & Input
- **Fix context panel selection state** — Selection state now refreshes correctly when the chat tool window is re-shown. (#7944)
- **Fix icon flickering in context panel** — Reuses selection components when adjusting file selections to avoid icon reload flicker. (#7947)
- **Context item source tracking** — Implemented source tracking for context items and updated close button visibility. (#7729)
- **Fix slash command popup** — Typing `/` now immediately shows the template popup without needing an additional character. (#7963)

### MCP
- **Disable MCP code vision when signed out** — MCP code lenses in `mcp.json` are now hidden when the user is not signed in. (#7994)
- **Fix auto-approve UI** — Corrected rendering issues in the auto-approve configuration panel. (#8087)

### Other Fixes
- **Fix WrapParagraphView exceptions** — Caught and handled exceptions to prevent layout errors. (#8275)
- **Fix gutter icon missing** — Restored missing gutter icons. (#8311)
- **Fix IOException in hasRunningCommands** — Caught `IOException` from terminal command detection with telemetry tracking. (#8178)
- **Fix deviceId storage on macOS** — Resolved an issue preventing device ID persistence on macOS. (#8076)
- **Fix markdown files open in preview** — Markdown files opened by Copilot now default to editor mode. (#7923)
- **Fix replace tool content sync** — Corrected synchronization of tool content replacement. (#8044)
- **Enhance language detection in CodeBlock** — Improved language detection and document handling for code blocks. (#7937)
- **Fix background colors for Code Review** — Updated background colors for consistent Code Review component styling. (#8041)
- **Manage coroutine scope lifecycle in input panel** — Prevented scope leaks in the chat input panel. (#8126)
- **Remove unnecessary textInputArea disposal** — Fixed disposal issues in `removeNotify`. (#8181)
- **Revert GIT_PAGER=cat** — Removed the `GIT_PAGER=cat` environment variable from `CopilotTerminalCustomizer`. (#8020)

## Infrastructure
- **Copilot Language Server** bumped from 1.420.0 to 1.435.0 (through intermediate versions 1.422.0, 1.427.0, 1.428.0, 1.429.0, 1.430.0, 1.432.0, 1.434.0)
- **Version format** updated to SemVer with `-rc.N` pre-release format
