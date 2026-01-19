package main

import (
	"fmt"
	"os"
	"strconv"
)

// Permission mapping from discord/data_source_discord_permission.go
var permissions = map[string]int64{
	"create_instant_invite":       0x1,
	"kick_members":                0x2,
	"ban_members":                 0x4,
	"administrator":               0x8,
	"manage_channels":             0x10,
	"manage_guild":                0x20,
	"add_reactions":               0x40,
	"view_audit_log":              0x80,
	"priority_speaker":            0x100,
	"stream":                      0x200,
	"view_channel":                0x400,
	"send_messages":               0x800,
	"send_tts_messages":           0x1000,
	"manage_messages":             0x2000,
	"embed_links":                 0x4000,
	"attach_files":                0x8000,
	"read_message_history":        0x10000,
	"mention_everyone":            0x20000,
	"use_external_emojis":         0x40000,
	"view_guild_insights":         0x80000,
	"connect":                     0x100000,
	"speak":                       0x200000,
	"mute_members":                0x400000,
	"deafen_members":              0x800000,
	"move_members":                0x1000000,
	"use_vad":                     0x2000000,
	"change_nickname":             0x4000000,
	"manage_nicknames":            0x8000000,
	"manage_roles":                0x10000000,
	"manage_webhooks":             0x20000000,
	"manage_emojis":               0x40000000,
	"use_application_commands":    0x80000000,
	"request_to_speak":            0x100000000,
	"manage_events":               0x200000000,
	"manage_threads":              0x400000000,
	"create_public_threads":       0x800000000,
	"create_private_threads":      0x1000000000,
	"use_external_stickers":       0x2000000000,
	"send_thread_messages":        0x4000000000,
	"start_embedded_activities":   0x8000000000,
	"moderate_members":            0x10000000000,
	"view_monetization_analytics": 0x20000000000,
	"use_soundboard":              0x40000000000,
	"create_expressions":          0x80000000000,
	"create_events":               0x100000000000,
	"use_external_sounds":         0x200000000000,
	"send_voice_messages":         0x400000000000,
	"set_voice_channel_status":    0x1000000000000,
	"send_polls":                  0x2000000000000,
	"use_external_apps":           0x4000000000000,
	"pin_messages":                0x8000000000000,
	"bypass_slowmode":             0x10000000000000,
}

func decodePermissions(bits int64) []string {
	var result []string
	for perm, bit := range permissions {
		if (bits & bit) != 0 {
			result = append(result, perm)
		}
	}
	return result
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: go run decode_permissions.go <permission_bits>")
		fmt.Println("       go run decode_permissions.go <allow_bits> <deny_bits>")
		fmt.Println()
		fmt.Println("Examples:")
		fmt.Println("  go run decode_permissions.go 274877910016")
		fmt.Println("  go run decode_permissions.go 2048 67108864")
		os.Exit(1)
	}

	allowBits, err := strconv.ParseInt(os.Args[1], 10, 64)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing permission bits: %v\n", err)
		os.Exit(1)
	}

	var denyBits int64

	// Check if there's a second number (deny bits)
	if len(os.Args) > 2 {
		denyBits, err = strconv.ParseInt(os.Args[2], 10, 64)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error parsing deny bits: %v\n", err)
			os.Exit(1)
		}
	}

	allowPerms := decodePermissions(allowBits)
	denyPerms := decodePermissions(denyBits)

	// Output as Terraform configuration
	fmt.Println("data \"discord_permission\" \"decoded\" {")
	for _, perm := range allowPerms {
		fmt.Printf("  %-30s = \"allow\"\n", perm)
	}
	for _, perm := range denyPerms {
		fmt.Printf("  %-30s = \"deny\"\n", perm)
	}
	fmt.Println("}")

}
