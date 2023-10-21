public struct Reaction: Codable {
  public var name: String
  public var users: [UserID]
  public var count: Int
}
