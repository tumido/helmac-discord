terraform {
  required_version = ">= 1.0"

  required_providers {
    discord = {
      source  = "local/lucky3028/discord"
      version = "~> 0.0.1"
    }
  }
}
