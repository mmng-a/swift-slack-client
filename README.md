# Swift Slack Client

## use client

```swift
import SlackClient
import Vapor

let app = Vapor.Application()
defer { app.shutdown() }
let token = "xoxp-xxxxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
let slackClient = SlackClient(app.client, slackBotToken: token)
try await slackClient.chatPostMessage(channel: channelID, text: "Hello, Slack app!")
```

## use app

when using vapor default pattern.

```swift
// in routes.swift
func routes(_ routes: some Vapor.RoutesBuilder) throws {
  let slackApp = SlackApp(routes)
  slackApp.onShortcut("new_application") { req, shortcut in
    try await ...
  }
}

// in configure.swift
func configure(_ app: Application) throws {
  try routes(app.routes)
}
```
