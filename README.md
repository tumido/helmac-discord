# Discord Server Terraform Configuration

This repository contains a declarative Terraform configuration for managing a Discord server infrastructure.

## Prerequisites

1. **Discord Bot Token**: You need a Discord bot with appropriate permissions
   - Go to [Discord Developer Portal](https://discord.com/developers/applications)
   - Create a new application or use an existing one
   - Go to the "Bot" section and copy the token
   - Invite the bot to your server with Administrator permissions

2. **Local Terraform Provider**: This configuration uses a local Discord provider
   - Ensure your provider binary is installed at: `~/.terraform.d/plugins/localhost/local/discord/<VERSION>/<OS>_<ARCH>/`
   - Or configure the provider source path appropriately

3. **Server ID**: Your Discord server (guild) ID
   - Enable Developer Mode in Discord (User Settings → Advanced → Developer Mode)
   - Right-click your server and select "Copy ID"

## Setup

### Option 1: Using Environment Variables (Recommended)

1. **Set up environment variables**:
   ```bash
   cp .env.example .env
   ```

2. **Edit .env** and add your values:
   ```bash
   TF_VAR_discord_token="YOUR_BOT_TOKEN"
   TF_VAR_server_id="YOUR_SERVER_ID"
   TF_VAR_server_name="Your Server Name"
   ```

3. **Load the environment variables**:

   ```bash
   export $(grep -v '^#' .env | xargs)
   ```

   Or if you prefer using direnv, create a `.envrc` file:

   ```bash
   dotenv
   ```

   Then run `direnv allow`

4. **Install the local provider** (if not already done):
   - Place your provider binary in the correct directory structure
   - The provider should be at: `~/.terraform.d/plugins/local/lucky3028/discord/0.0.1/<OS>_<ARCH>/terraform-provider-discord`

5. **Initialize Terraform**:
   ```bash
   terraform init
   ```

### Option 2: Using terraform.tfvars File

1. **Copy the example variables file**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Edit terraform.tfvars** and add your values:

   ```hcl
   discord_token = "YOUR_BOT_TOKEN"
   server_id     = "YOUR_SERVER_ID"
   server_name   = "Your Server Name"
   ```

3. Follow steps 4-5 from Option 1 above.

## Usage

### Import Existing Server Configuration

To import your existing Discord server configuration:

```bash
# Import the server
terraform import discord_server.main YOUR_SERVER_ID

# Import channels (example)
terraform import discord_text_channel.general CHANNEL_ID

# Import roles (example)
terraform import discord_role.moderator ROLE_ID
```

### View Changes

```bash
terraform plan
```

### Apply Configuration

```bash
terraform apply
```

### Export Current State

To dump your full server configuration, you can use Terraform's state commands:

```bash
# Show all resources
terraform state list

# Show specific resource details
terraform state show discord_server.main
```

## Configuration Structure

- [versions.tf](versions.tf) - Terraform and provider version requirements
- [provider.tf](provider.tf) - Discord provider configuration
- [variables.tf](variables.tf) - Input variable definitions
- [main.tf](main.tf) - Main Discord server resources (channels, roles, etc.)
- [terraform.tfvars](terraform.tfvars) - Variable values (not committed, sensitive)

## Customization

The [main.tf](main.tf) file contains example resources. Customize it to match your server structure:

- **Categories**: Define channel categories
- **Text Channels**: Configure text channels with topics and permissions
- **Voice Channels**: Set up voice channels with bitrate and user limits
- **Roles**: Create and manage server roles with permissions
- **Channel Permissions**: Override permissions for specific roles/users

## Important Notes

- **Never commit sensitive files** - Both terraform.tfvars and .env contain sensitive tokens
- **Backup your state file** - The terraform.tfstate file contains your infrastructure state
- **Test changes carefully** - Use `terraform plan` before applying
- **Permission Numbers**: Discord uses bitwise permission integers. Refer to [Discord's permission documentation](https://discord.com/developers/docs/topics/permissions)

## Common Permission Values

```
Administrator: 8
Manage Channels: 16
Manage Server: 32
Manage Messages: 8192
Send Messages: 2048
View Channel: 1024
```

## Troubleshooting

### Provider Not Found
Ensure your provider binary is in the correct location and the version in [versions.tf](versions.tf) matches.

### Authentication Failed
Verify your bot token is correct and the bot is invited to your server with proper permissions.

### Import Errors
Make sure you're using the correct resource IDs from Discord.
