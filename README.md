# Landmarks

This repository contains a simple SwiftUI demo app based on [Apple's SwiftUI tutorial](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views). It is designed as a **hands-on workshop** to demonstrate how to use  
**GitHub Copilot for Xcode**, including:

- Copilot Chat & Inline Suggestions
- Agent Mode for multi-file refactoring
- Copilot Vision (optional)
- MCP Servers (GitHub) integration

---

## Prerequisites

Before starting the workshop, make sure you have:

- **Xcode 15 or later**
- **Latest version of GitHub Copilot for Xcode**
- Signed in to **GitHub** in Xcode
- A GitHub account with permission to create repositories


## Getting Started with Copilot for Xcode

### 1. Chat with GitHub Copilot

Copilot Chat helps you understand existing code using natural language.

1. Open any Swift file in Xcode.
2. Open the **Copilot Chat** panel.
3. Type the following prompt: Explain this file
4. Select **Ask** mode and press **Enter**.
5. Copilot will display the explanation below your question.


### 2. Get Your First Inline Suggestion

Inline suggestions help you complete code faster directly in the editor.

1. Open `LandmarkRow.swift`  
Path: `Landmarks / Views / Landmarks / LandmarkRow.swift`

2. Go to **line 14** and add the following comment:

```swift
// show landmark description also. max one line with tooltip to show up full description
```


3. Copilot will suggest code similar to:
```
Text(landmark.description)...
```
Press Tab to accept the suggestions as follows.


### Use Agent mode
1. Open LandmarkList.swift
Path: Landmarks / Views / Landmarks / LandmarkList.swift
2. Open the Copilot Chat panel and Enter the following prompt:
Change all the favorite buttons to heart shapes in the view
3. Select Agent mode and press Enter.
4. Copilot will automatically find and update the relevant files.
5. You can continue with additional prompts, for example: Add a rating score with mocked data in the detail view

#### Use Copilot Vision with Agent mode

Copilot Vision allows Copilot to understand UI layouts and screenshots alongside code. If Copilot Vision is enabled in your environment, you can combine UI context with Agent Mode and upload your Images directly.


Example prompts:

1. Implement this view layout based on uploaded images”
2. “Optimize the UI for smaller screen sizes”

### Set up your Github MCP Server

MCP (Model Context Protocol) Servers extend Copilot with external tools such as GitHub.

1. Open the Copilot Chat panel.
2. Click Configure MCP Server (wrench icon).
3. Under MCP Registry URL, click Browse MCP Servers…
4. Select GitHub and click Install.
5.  Choose the GitHub account you want Copilot to access.
6. After installation, Open the Tools tab in Copilot Chat. You should see the GitHub MCP Server available


#### Use GitHub MCP Server in Chat

1. Try this prompt:
List available MCP servers and help me create a new repository named MyLandmarkApp.

2. Copilot will return a GitHub repository URL. Or you can follow the steps here to continue.


## Running tests

This app uses XCTestPlans.

### Running locally

```
xcodebuild test \
  -scheme Landmarks \
  -destination 'platform=iOS Simulator,name=iPhone 15'
```




