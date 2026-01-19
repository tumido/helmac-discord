variable "discord_token" {
  description = "Discord bot token for authentication"
  type        = string
  sensitive   = true
}

variable "server_id" {
  description = "Discord server (guild) ID to manage"
  type        = string
}
