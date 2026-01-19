#!/bin/sh

# scripts/import-division garant hospoda <id>

terraform import discord_role.divize_$1\[\"$2\"\] $TF_VAR_server_id:$3
