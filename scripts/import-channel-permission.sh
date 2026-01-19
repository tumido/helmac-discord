#!/bin/sh

# scripts/import-channel-permission.sh <channel> <channel_id>
# Example: scripts/import-channel-permission.sh info 1234567890

if [ $# -ne 2 ]; then
  echo "Usage: $0 <channel> <channel_id>"
  exit 1
fi

channel=$1
channel_id=$2

# List of all divisions with their IDs (parallel arrays)
# Each line: "division-name:override_id"
divisions="
hradební-divize:1222283151666057256
hospoda:1222283255563423784
mimobitevní-program:1462755505159274705
kuchyň:1222283684086939738
otrocké-práce:1222283738566623243
školka:1222283829109325896
registračka:1222283869852663900
zázemí:1222283910365450281
marketing:1222283950936817686
příprava-bitvy:1222294284846366810
rekvizity:1316080463487696926
pravidla-bitvy:1355536633654415460
turnaje:1222283619129757827
zdravotníci:1381598446162546829
harém:1407476719404974120
ritual:1462755522972483748
"

# Loop over each division
while IFS=: read -r division override_id; do
  # Skip empty lines
  [ -z "$division" ] && continue

  echo "Processing division: $division (ID: $override_id)"

  if [ -n "$override_id" ]; then
    read -p "Does this permission exist for $division? (y/n): " confirm </dev/tty
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
      terraform import discord_channel_permission.$channel-garant\[\"$division\"\] $channel_id:$override_id:role
    else
      echo "Skipping import for $division"
    fi
  else
    echo "Skipping $division (ID not configured)"
  fi
  echo ""
done <<EOF
$divisions
EOF

# List of other roles with their IDs
# Each line: "role-name:override_id"
roles="
admin:1221966144131432508
tatka-smoula:1314998564094476430
garant-bez-portfeje:1315023225092047030
everyone:1221956494145355777
"

while IFS=: read -r role override_id; do
  # Skip empty lines
  [ -z "$role" ] && continue

  echo "Processing role: $role (ID: $override_id)"

  if [ -n "$override_id" ]; then
    read -p "Does this permission exist for $role? (y/n): " confirm </dev/tty
    if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
      terraform import discord_channel_permission.$channel-$role $channel_id:$override_id:role
    else
      echo "Skipping import for $role"
    fi
  else
    echo "Skipping $role (ID not configured)"
  fi
  echo ""
done <<EOF
$roles
EOF
