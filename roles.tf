resource "discord_role" "admin" {
  color       = 8355711
  hoist       = true
  mentionable = false
  name        = "Moderátor serveru"
  permissions = 8
  position    = 38
  server_id   = discord_server.helmac.id
}
resource "discord_role" "terraform" {
  color       = 0
  hoist       = false
  mentionable = false
  name        = "Sync via Terraform"
  permissions = 8
  position    = 36
  server_id   = discord_server.helmac.id
}

resource "discord_role" "tatka-smoula" {
  color       = 3447003
  hoist       = false
  mentionable = false
  name        = "Taťka šmoula"
  permissions = data.discord_permission.tatka-smoula.allow_bits
  position    = 35
  server_id   = discord_server.helmac.id
}

resource "discord_role" "garant-bez-portfeje" {
  hoist       = false
  mentionable = false
  name        = "Garant bez portfeje"
  permissions = 0
  position    = 34
  server_id   = discord_server.helmac.id
}

resource "discord_role" "divize_clen" {
  for_each    = { for idx, div in local.divize : div.name => merge(div, { index = idx }) }
  color       = each.value.color.clen
  mentionable = false
  name        = "Člen - ${each.key}"
  permissions = 0
  #   position    = (length(local.divize) - each.value.index) * 2 # Position works as an array insert = troubles. It doesn't matter here much anyways.
  server_id = discord_server.helmac.id
}

resource "discord_role" "divize_garant" {
  for_each    = { for idx, div in local.divize : div.name => merge(div, { index = idx }) }
  color       = each.value.color.garant
  hoist       = true
  mentionable = false
  name        = "Garant - ${each.key}"
  permissions = data.discord_permission.garant.allow_bits
  #   position    = (length(local.divize) - each.value.index) * 2 + 1. # Position works as an array insert = troubles. It doesn't matter here much anyways.
  server_id = discord_server.helmac.id
}

resource "discord_role" "cumil" {
  color       = 5533306
  mentionable = false
  name        = "Čumil"
  permissions = 0
  position    = 1
  server_id   = discord_server.helmac.id
}

resource "discord_role_everyone" "everyone" {
  server_id   = discord_server.helmac.id
  permissions = data.discord_permission.everyone.allow_bits
}
