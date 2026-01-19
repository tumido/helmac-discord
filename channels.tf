# Config for individual channels including permissions

# Channel #info
resource "discord_text_channel" "info" {
  name                     = "info"
  nsfw                     = false
  position                 = 0
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "info-admin" {
  allow        = data.discord_permission.allow_send_messages.allow_bits
  channel_id   = discord_text_channel.info.id
  deny         = 0
  overwrite_id = discord_role.admin.id
  type         = "role"
}
resource "discord_channel_permission" "info-everyone" {
  allow        = 0
  channel_id   = discord_text_channel.info.id
  deny         = data.discord_permission.deny_send_messages.deny_bits
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}

# Channel #důležité
resource "discord_news_channel" "dulezite" {
  name                     = "důležité"
  position                 = 1
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "dulezite-admin" {
  allow        = data.discord_permission.allow_send_messages.allow_bits
  channel_id   = discord_news_channel.dulezite.id
  deny         = 0
  overwrite_id = discord_role.admin.id
  type         = "role"
}
resource "discord_channel_permission" "dulezite-tatka-smoula" {
  allow        = data.discord_permission.garant_access.allow_bits
  channel_id   = discord_news_channel.dulezite.id
  overwrite_id = discord_role.tatka-smoula.id
  type         = "role"
}
resource "discord_channel_permission" "dulezite-garant-bez-portfeje" {
  allow        = data.discord_permission.garant_access.allow_bits
  channel_id   = discord_news_channel.dulezite.id
  overwrite_id = discord_role.garant-bez-portfeje.id
  type         = "role"
}
resource "discord_channel_permission" "dulezite-everyone" {
  allow        = data.discord_permission.allow_react.allow_bits
  channel_id   = discord_news_channel.dulezite.id
  deny         = data.discord_permission.deny_send_messages.deny_bits
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}
resource "discord_channel_permission" "dulezite-garant" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.garant_access.allow_bits
  channel_id   = discord_news_channel.dulezite.id
  overwrite_id = discord_role.divize_garant[each.key].id
  type         = "role"
}


# Channel #úřední-deska
resource "discord_forum_channel" "uredni-deska" {
  name                     = "úřední-deska"
  position                 = 2
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "uredni-deska-admin" {
  allow        = data.discord_permission.allow_send_messages.allow_bits
  channel_id   = discord_forum_channel.uredni-deska.id
  deny         = 0
  overwrite_id = discord_role.admin.id
  type         = "role"
}
resource "discord_channel_permission" "uredni-deska-tatka-smoula" {
  allow        = data.discord_permission.allow_create_posts.allow_bits
  channel_id   = discord_forum_channel.uredni-deska.id
  overwrite_id = discord_role.tatka-smoula.id
  type         = "role"
}
resource "discord_channel_permission" "uredni-deska-garant-bez-portfeje" {
  allow        = data.discord_permission.allow_create_posts.allow_bits
  channel_id   = discord_forum_channel.uredni-deska.id
  overwrite_id = discord_role.garant-bez-portfeje.id
  type         = "role"
}
resource "discord_channel_permission" "uredni-deska-everyone" {
  allow        = data.discord_permission.allow_read_posts.allow_bits
  channel_id   = discord_forum_channel.uredni-deska.id
  deny         = data.discord_permission.allow_read_posts.deny_bits
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}
resource "discord_channel_permission" "uredni-deska-garant" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.allow_create_posts.allow_bits
  channel_id   = discord_forum_channel.uredni-deska.id
  overwrite_id = discord_role.divize_garant[each.key].id
  type         = "role"
}

# Channel #nápady
resource "discord_forum_channel" "napady" {
  name                     = "nápady"
  position                 = 3
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "napady-everyone" {
  allow        = 0
  channel_id   = discord_forum_channel.napady.id
  deny         = 0
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}


# Channel #společný-chat
resource "discord_text_channel" "spolecny-chat" {
  name                     = "společný-chat"
  position                 = 4
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "spolecny-chat-everyone" {
  allow        = 0
  channel_id   = discord_text_channel.spolecny-chat.id
  deny         = 0
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}


# Channel #moderator-only
resource "discord_text_channel" "moderator-only" {
  name                     = "moderator-only"
  position                 = 5
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "moderator-only-admin" {
  allow        = data.discord_permission.allow_view_channel.allow_bits
  channel_id   = discord_text_channel.moderator-only.id
  deny         = 0
  overwrite_id = discord_role.admin.id
  type         = "role"
}
resource "discord_channel_permission" "moderator-only-everyone" {
  allow        = 0
  channel_id   = discord_text_channel.moderator-only.id
  deny         = data.discord_permission.deny_view_channel.deny_bits
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}


# Channel #discord-help
resource "discord_text_channel" "discord-help" {
  name                     = "discord-help"
  position                 = 6
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
  topic                    = "Jsi na Discordu nový a potřebuješ s něčím poradit? Tady je to správné místo, kde ti pomůžeme!"
}
resource "discord_channel_permission" "discord-help-everyone" {
  allow        = 0
  channel_id   = discord_text_channel.discord-help.id
  deny         = 0
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}

# Channel #stoka
resource "discord_text_channel" "stoka" {
  name                     = "stoka"
  position                 = 7
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "stoka-everyone" {
  allow        = 0
  channel_id   = discord_text_channel.stoka.id
  deny         = 0
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}

# Channel #garanti
resource "discord_text_channel" "garanti" {
  name                     = "garanti"
  position                 = 8
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "garanti-admin" {
  allow        = data.discord_permission.allow_view_channel.allow_bits
  channel_id   = discord_text_channel.garanti.id
  deny         = 0
  overwrite_id = discord_role.admin.id
  type         = "role"
}
resource "discord_channel_permission" "garanti-tatka-smoula" {
  allow        = data.discord_permission.allow_view_channel.allow_bits
  channel_id   = discord_text_channel.garanti.id
  deny         = 0
  overwrite_id = discord_role.tatka-smoula.id
  type         = "role"
}
resource "discord_channel_permission" "garanti-garant-bez-portfeje" {
  allow        = data.discord_permission.allow_view_channel.allow_bits
  channel_id   = discord_text_channel.garanti.id
  deny         = 0
  overwrite_id = discord_role.garant-bez-portfeje.id
  type         = "role"
}
resource "discord_channel_permission" "garanti-everyone" {
  allow        = 0
  channel_id   = discord_text_channel.garanti.id
  deny         = data.discord_permission.deny_view_channel.deny_bits
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}
resource "discord_channel_permission" "garanti-garant" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.allow_view_channel.allow_bits
  channel_id   = discord_text_channel.garanti.id
  deny         = 0
  overwrite_id = discord_role.divize_garant[each.key].id
  type         = "role"
}

# Voice channel #prostě voice chat
resource "discord_voice_channel" "proste-voice-chat" {
  name                     = "prostě voice chat"
  position                 = 0
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "proste-voice-chat-everyone" {
  allow        = 0
  channel_id   = discord_voice_channel.proste-voice-chat.id
  deny         = 0
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}

# Category Jednotlivé oblasti a divize
resource "discord_category_channel" "divize" {
  name      = "Jednotlivé oblasti a divize"
  position  = 0
  server_id = discord_server.helmac.id
}

# Channel for each devision
resource "discord_text_channel" "divize" {
  for_each = { for idx, div in local.divize : div.name => merge(div, { index = idx }) }

  category                 = discord_category_channel.divize.id
  name                     = each.key
  position                 = each.value.index + 9
  server_id                = discord_server.helmac.id
  sync_perms_with_category = false
}
resource "discord_channel_permission" "divize-admin" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.garant_access.allow_bits
  channel_id   = discord_text_channel.divize[each.key].id
  deny         = 0
  overwrite_id = discord_role.admin.id
  type         = "role"
}
resource "discord_channel_permission" "divize-tatka-smoula" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.garant_access.allow_bits
  channel_id   = discord_text_channel.divize[each.key].id
  deny         = 0
  overwrite_id = discord_role.tatka-smoula.id
  type         = "role"
}
resource "discord_channel_permission" "divize-garant" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.garant_access.allow_bits
  channel_id   = discord_text_channel.divize[each.key].id
  deny         = 0
  overwrite_id = discord_role.divize_garant[each.key].id
  type         = "role"
}
resource "discord_channel_permission" "divize-clen" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.clen_access.allow_bits
  channel_id   = discord_text_channel.divize[each.key].id
  deny         = 0
  overwrite_id = discord_role.divize_clen[each.key].id
  type         = "role"
}
resource "discord_channel_permission" "divize-cumil" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.allow_view_channel.allow_bits
  channel_id   = discord_text_channel.divize[each.key].id
  deny         = 0
  overwrite_id = discord_role.cumil.id
  type         = "role"
}
resource "discord_channel_permission" "divize-everyone" {
  for_each     = toset([for div in local.divize : div.name])
  allow        = data.discord_permission.allow_read_message_history.allow_bits
  channel_id   = discord_text_channel.divize[each.key].id
  deny         = data.discord_permission.allow_read_message_history.deny_bits
  overwrite_id = discord_role_everyone.everyone.id
  type         = "role"
}



