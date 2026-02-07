# ORK

**ORK** (Personal VLESS automation toolset - ORKestrator) is an automated toolset for deploying and managing a personal VLESS node. It leverages Terraform for infrastructure provisioning and Ansible for configuration management.

**The concept is simple: Pay only for what you use.**
Most cloud providers charge by the hour. When you need a VPN, **ORK** spins up a server, deploys X-UI, and configures your users in minutes. When you're done, **ORK** destroys everything, stopping the billing.

```text
                                       ▄▄▄  ▄ •▄ 
                                 ▪     ▀▄ █·█▌▄▌▪
                                  ▄█▀▄ ▐▀▀▄ ▐▀▀▄·
                                 ▐█▌.▐▌▐█•█▌▐█.█▌
                                  ▀█▄▀▪.▀  ▀·▀  ▀
       
                                   ⢀⣤⣶⣾⣿⣿⣷⣿⣾⣶⣦⣄⣀                   
                                ⣠⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤                 
                              ⢀⣾⣿⣆⢠⣹⣿⢽⣿⣷⣿⣿⡿⣿⣿⣯⣉⠿⡘⣿⣿⣿               
                             ⣴⣿⣿⣿⣿⣿⣼⣿⣿⢿⣿⣯⣿⣿⣥⣟⣿⡿⢶⣭⣀⠎⣿⣿              
                            ⣶⣿⣿⣿⣿⣿⣿⡿⢂⠽⣿⢻⣿⣯⣸⣃⣈⡵⣓⠯⣯⣒⣀⣿⢿⣇             
                   ⣀       ⢀⣿⣿⣿⣿⣿⣿⣟⣉⣉⠻⣾⣻⠹⠏⠡⡶⠛⢓⣀⡅⢄⡄⠂⣬⣿⣿⠄      ⣀⣶⡾⠈  
                   ⠙⣶⣰⣦⢀   ⣾⣿⠛⣿⣿⣿⣿⣿⣿⣿⣿⣎⢿⣿⣼⢘⡁⣿⣿⣿⣿⠟ ⢈⣰⠏⢙⡇  ⢀⣠⣶⣿⠟⣿⠁   
                    ⠈⣿⣿⣿⣷⣶⣿⣿⡈⠙⣿⣿⢻⣿⣛⣿⣿⣿⢻⡆⠓⢋⢘⣽⣿⣿⣿⠟⡗⠽⢜⣋⠖⠉⠑⠚⠿⣿⠟⠁ ⡟     
                     ⣿⣿⡿⣿⡿⢘⢿⣿⣄    ⠁ ⣛⢌⠿ ⠃⠁⠿⡟⢀ ⢀⠐⠈  ⢀ ⠃⡆⢄⢀ ⠂ ⣿⠋     
                     ⠈⠛⣿⡟⡃⡔⣿⣟⢿⣮⡒ ⢙⠛  ⣀ ⣋⠁⠒⢠  ⠘⠛⠁⢀⠉ ⢀⠢⢸⠈⠐⢠⠁ ⡟       
                     ⢰⣾⣿⠂⢰⣾⣻⣋⣴⣿⣿⣷⣶⣤⢠⣿⠿⣿⣿⣿⣿⣶⣶⣷⡌⢀⣠⣤⣶⣿⡿⣁⠊ ⠌⠠⢰⠋        
                     ⢹⣿⣡⠇⡶⠉⠐⠤⠫⠉⠉⣩⢸⣿⣤⣠⣀⠈⣿⣿⡿⠛⠉⢹⠃⢨⡟⠉⠋   ⠈⠁  ⡟         
                     ⠈⣿⠇⢀⣯⣴⣤⠁⢆⣴⡛ ⣤⣽⢾⢿⣿⣀   ⠄⢈⣤⣷⣾⠏⠤⢊⡙⠉⡠⡞⣠ ⡿          
                    ⢀⣾⡿⠃⠂⣿⣿⠛⣄⠳⢳⢿⡘⣿⣿⠾⡸⣿⣿⣷⣰⣶⣆⣿⣻⡟⠃⣴⠋⢀⢠⢙⠁⢀⡆⡌           
                   ⠰⣿⢹⠉  ⣿⣿⣷⠘ ⠈⣧⣧⢉⢉   ⠈  ⠉⠙⠛⠛ ⣾ ⠂⣴⢁⠃⢀⣿⣇⠸           
                    ⠻⠂⣸  ⢿⣿⣿⣷⡄⠧⣤⣿⠙⣽ ⠸⠈⣄⠃⢛⣨⡉ ⠻⠛⠻⠁⠐ ⠃⣴⣿⣿⡏ ⢻          
                     ⠙⢿⣧ ⠄⣿⣿⣿⣿⣤⣾⣿⢸⣿⣲⣿⣿⣿⡇⠓⣿⣿⢾⣷⣿⣶⣾⣥⣷⢿⣿⣿⠟⢀⣀⠘⡄         
                      ⠘⣿ ⠈⠊⠻⠿⠿⢛⣈⠉⣚⢛⠛⣛⣉⣛⢁⠹⠿⣛⡇⣛⣻⠟⠃⠻⠛⠙⣻⠑ ⢃⣷⡄⣟         
                       ⢿ ⢤⠾⣿⡟⢿⣿⣿⡿⠟⠻⠻⠿⠿⠿⣿⣿⣿⣿⣲⣿⣿⣿⣿⡶⣶⣴⡈⣶⣝⣈⢻⣿⠁         
                       ⢺⡄⡸⢂⠙⠟⠋⠁            ⠉⠁ ⢉⡋⠉⠙⠿⠿⠉⢂ ⣿⠟          
                       ⢼⣯ ⠙  ⠄⠄⣀⣴⣿⣿⣿⣿⠿⣿⣷⣧⣷⣶⣔⢤⣀  ⠙⠕⠃⠁⠁ ⡿⠁           
                       ⠘⣿⣿⡍⣴⣞⠹⣻⣿⣿⣿⡟⠓ ⣾⣿⣿⡿⣿⣿⣿⣿⡗⣖⣗⠙ ⣤⢶ ⣾⠋            
                        ⠈⢿⣿⡇⡾⣾⣿⠓⣿⡿⠁ ⣰⡿⡿⢷⠗⡿⣋⣿⠿⣃⠿⠋⠂⡾⠡⡐⣸⠃             
                          ⠙⢟⣿⣕⣼⣇⡤⣾⣄ ⣿ ⠣⠁⠑⠒⠒⣉⠍⣒⢃⣔⠛⡥⠋⣖⠃              
                             ⠉⠉⠙⠛⠛⠛⠛⣿⣆⣖⡉⠉⠉⢉⡁⠄⠲⠛⠐⣠⣴⠛                
                                       ⠃⠓⠲⣲⣶⣩⠞⠙⠉     
        (       )     )                  (         )               (     ____ 
        )\ ) ( /(  ( /((   *   )   (     )\ )   ( /( (       (     )\ ) |   / 
       (()/( )\()) )\())\` )  /(   )\   (()/(   )\()))\ )    )\   (()/( |  /  
        /(_)|(_)\|((_)((_)( )(_)|(((_)(  /(_)) ((_)\(()/( ((((_)(  /(_))| /   
       (_))   ((_)_ ((_) (_(_()) )\ _ )\(_))     ((_)/(_))_)\ _ )\(_))  |/    
       | |   / _ \ |/ /  |_   _| (_)_\(_) _ \   / _ (_)) __(_)_\(_) _ \(      
       | |__| (_) |' <     | |    / _ \ |   /  | (_) || (_ |/ _ \ |   /)\     
       |____|\___/_|\_\    |_|   /_/ \_\|_|_\   \___/  \___/_/ \_\|_|_((_)    
       
          
```
## ✨ Why ORK?

*   **Automation:** Replaces manual VM creation, OS setup, panel installation, and client configuration.
*   **Cost Efficiency:** Designed for ephemeral usage. Create just for the session, destroy afterwards.
*   **User Management:** Maintain your user list locally. Deploying a new server restores all users with their unique IDs (though connection strings will update if the IP changes).
*   **Note:** Your provider *might* assign the same IP address if you redeploy quickly, but don't count on it.

## 📂 Project Structure

```text
.
├── ork              # Main control script
├── .secrets         # API tokens and secrets
├── data/            # Local state and outputs
│   ├── secrets/     # Generated keys and user map
│   ├── configs/     # Client connection strings
│   └── users.list   # User definitions
├── terraform/       # Infrastructure definitions
└── ansible/         # Configuration playbooks
```

## 🚀 Usage

```bash
ork {dab|zug|die|lok}
```

### 1. Dabu! (Init)

Initialize tools and dependencies. Run this first.

```bash
./ork dab
```

*   **ORK_HCLOUD_TOKEN:** Your Hetzner project API token.
*   **ORK_PANEL_USERNAME / PASSWORD:** Credentials for the 3x-ui web panel.
*   **ORK_SSH_KEY_PATH:** Path to your private SSH key (default: `.ssh/id_ed25519` in project root).

### 2. Zug-zug! (Deploy/Update)

Build the ziggurat (deploy infrastructure) and send peons to work (configure software).

```bash
./ork zug
```

If you only added new users to `data/users.list` and don't need to check infrastructure:

```bash
./ork zug --peon
```

### 3. Kill it! (Destroy)

Destroy the infrastructure.

```bash
./ork die
```

*   `-f`: Force destroy (no confirmation).
*   `--ash`: Burn it all (Full wipe: infrastructure + local data).

### 4. Lok-tar Ogar! (Version)

Show version and logo.

```bash
./ork lok
```

## 🛠 Configuration

Configuration is handled via environment variables, loaded from `.secrets` or passed exclusively to the script. All variables have the `ORK_` prefix to avoid conflicts.

| Variable | Default | Description |
| :--- | :--- | :--- |
| `ORK_HCLOUD_TOKEN` | *PROMPT* | Hetzner Cloud API Token |
| `ORK_SSH_USER` | `x3` | SSH username for the server |
| `ORK_SSH_KEY_PATH` | `.ssh/id_ed25519` | Path to SSH private key (relative to project root) |
| `ORK_PANEL_USERNAME` | *PROMPT* | 3x-ui panel admin username |
| `ORK_PANEL_PASSWORD` | *PROMPT* | 3x-ui panel admin password |
| `ORK_TF_VERSION` | `1.14.4` | Terraform version to use |
| `ORK_ANSIBLE_VERSION` | `2.20.2` | Ansible version to use |

## 📋 User Management

The `data/users.list` file is the **source of truth** for users on the server.
1.  **Add a user:** Add a new line with the username (any string, e.g. `user1`, `phone_ipad`).
2.  **Remove a user:** Delete the line.
3.  **Sync:** Run `./ork zug` (or `./ork zug --peon` for faster updates).

> [!WARNING]
> If `users.list` is empty, running `./ork zug` will **remove all users** from the server. You will be prompted for confirmation.

### Persistence

ORK stores user credentials (UUIDs, keys) locally in `data/secrets/users.json`.
Even if you destroy the server with `./ork die`, this data is preserved. When you deploy a new server with `./ork zug`, the same UUIDs and keys will be reused for existing users (though connection strings will change due to the new server IP).
To completely wipe local data, use `./ork die --ash`.

## 📜 License

Property of the Horde. No elfs allowed.
