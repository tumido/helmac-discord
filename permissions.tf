data "discord_permission" "tatka-smoula" {
  manage_events = "allow"
  create_events = "allow"
  manage_roles  = "allow"
}

data "discord_permission" "garant" {
  manage_events = "allow"
  create_events = "allow"
}

data "discord_permission" "everyone" {
  connect                   = "allow"
  use_external_apps         = "allow"
  use_soundboard            = "allow"
  add_reactions             = "allow"
  create_instant_invite     = "allow"
  request_to_speak          = "allow"
  stream                    = "allow"
  view_channel              = "allow"
  use_external_emojis       = "allow"
  speak                     = "allow"
  use_vad                   = "allow"
  change_nickname           = "allow"
  use_external_stickers     = "allow"
  start_embedded_activities = "allow"
  use_external_sounds       = "allow"
  send_voice_messages       = "allow"
  attach_files              = "allow"
  read_message_history      = "allow"
  set_voice_channel_status  = "allow"
  use_application_commands  = "allow"
  create_public_threads     = "allow"
  send_thread_messages      = "allow"
  send_polls                = "allow"
  send_messages             = "allow"
}

data "discord_permission" "allow_send_messages" {
  send_messages = "allow"
}

data "discord_permission" "deny_send_messages" {
  send_messages = "deny"
}

data "discord_permission" "allow_react" {
  use_external_emojis   = "allow"
  add_reactions         = "allow"
  use_external_stickers = "allow"
}


data "discord_permission" "garant_access" {
  add_reactions             = "allow"
  attach_files              = "allow"
  create_public_threads     = "allow"
  embed_links               = "allow"
  manage_messages           = "allow"
  manage_threads            = "allow"
  mention_everyone          = "allow"
  pin_messages              = "allow"
  send_messages             = "allow"
  send_polls                = "allow"
  send_thread_messages      = "allow"
  send_tts_messages         = "allow"
  send_voice_messages       = "allow"
  start_embedded_activities = "allow"
  use_application_commands  = "allow"
  use_external_emojis       = "allow"
  use_external_stickers     = "allow"
  view_channel              = "allow"
}
data "discord_permission" "clen_access" {
  add_reactions             = "allow"
  attach_files              = "allow"
  embed_links               = "allow"
  mention_everyone          = "allow"
  send_messages             = "allow"
  send_polls                = "allow"
  use_external_emojis       = "allow"
  use_external_stickers     = "allow"
  use_application_commands  = "allow"
  view_channel              = "allow"
  create_public_threads     = "allow"
  send_tts_messages         = "allow"
  send_voice_messages       = "allow"
  send_thread_messages      = "allow"
  start_embedded_activities = "allow"
}

data "discord_permission" "allow_create_posts" {
  send_messages  = "allow"
  manage_threads = "allow"
}

data "discord_permission" "allow_read_posts" {
  manage_channels           = "deny"
  manage_messages           = "deny"
  send_messages             = "deny"
  manage_roles              = "deny"
  manage_threads            = "deny"
  create_instant_invite     = "deny"
  manage_webhooks           = "deny"
  add_reactions             = "allow"
  attach_files              = "allow"
  embed_links               = "allow"
  mention_everyone          = "allow"
  read_message_history      = "allow"
  send_thread_messages      = "allow"
  send_tts_messages         = "allow"
  send_voice_messages       = "allow"
  start_embedded_activities = "allow"
  use_application_commands  = "allow"
  use_external_emojis       = "allow"
  use_external_stickers     = "allow"
  view_channel              = "allow"
}

data "discord_permission" "allow_view_channel" {
  view_channel = "allow"
}

data "discord_permission" "deny_view_channel" {
  view_channel = "deny"
}

data "discord_permission" "allow_read_message_history" {
  add_reactions             = "deny"
  attach_files              = "deny"
  bypass_slowmode           = "deny"
  create_instant_invite     = "deny"
  create_private_threads    = "deny"
  create_public_threads     = "deny"
  embed_links               = "deny"
  manage_channels           = "deny"
  manage_messages           = "deny"
  manage_roles              = "deny"
  manage_threads            = "deny"
  manage_webhooks           = "deny"
  mention_everyone          = "deny"
  read_message_history      = "allow"
  pin_messages              = "deny"
  send_messages             = "deny"
  send_polls                = "deny"
  send_thread_messages      = "deny"
  send_tts_messages         = "deny"
  send_voice_messages       = "deny"
  start_embedded_activities = "deny"
  use_application_commands  = "deny"
  use_external_apps         = "deny"
  use_external_emojis       = "deny"
  use_external_stickers     = "deny"
  view_channel              = "deny"
}
