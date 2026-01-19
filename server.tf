resource "discord_server" "helmac" {
  name                          = "Helmáč"
  default_message_notifications = 1
  explicit_content_filter       = 2
  verification_level            = 1
}
