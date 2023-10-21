import Vapor
import SlackClient

@main
struct DoSlackAPI {
  static let token = "xoxp-xxxxxxxxxx-xxxxxxxxxx-xxxxxxxxxx"
  static let myUserID: UserID = "Uxxxxxxxxxx"
  
  static func main() async throws {
    let app = Application()
    defer { app.shutdown() }
    let slackClient = SlackClient(app.client, slackBotToken: token)
    let channelID = ChannelID("C043XQ1JLKE")
    let messageTimeStamp = "1689382304.636199"
    let reactions = try await slackClient
      .reactionsGet(channel: channelID, ts: messageTimeStamp, full: true)
    let userList = try await slackClient.usersList(limit: 500)
    try await slackClient.chatPostMessage(channel: channelID, text: "Reactions List") {
      Section(.markdown("*Reactions List*")) {
        for reaction in reactions.reactions {
          let userList = reaction.users.map(\.description).joined(separator: " ")
          Markdown(":\(reaction.name): (\(reaction.name))\n\(userList)")
        }
      }
    }
  }
}
