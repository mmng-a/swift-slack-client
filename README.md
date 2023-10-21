# Swift Slack Client

## use client

```swift
import SlackClient
import Vapor

let app = Vapor.Application()
defer { app.shutdown() }
let slackClient = SlackClient(app.client, slackBotToken: token)
```

## use app

write below in routes.swift created vapor default patern.

```swift
func routes(_ routes: some Vapor.RoutesBuilder) throws {
  let slackApp = SlackApp(routes)
  slackApp.onShortcut("new_application") { req, shortcut in
    try await ...
  }
}
```
