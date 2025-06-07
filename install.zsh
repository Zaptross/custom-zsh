#!/usr/bin/env zsh

# Get the directory where this script is located
SCRIPT_DIR="${0:A:h}"

echo "Custom ZSH Configuration Installer"
echo "=================================="

# Function to ask yes/no questions
ask_yes_no() {
    local prompt="$1"
    local response
    while true; do
        # default to no
        read "response?$prompt (y/N): "
        case "$response" in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) return 1;;
        esac
    done
}

# Copy dotfiles (excluding .gitignore)
echo "\n--- Dotfiles ---"
for file in "$SCRIPT_DIR"/.*; do
    # Skip . and .. directories and .gitignore
    if [[ "$(basename "$file")" == "." ]] || [[ "$(basename "$file")" == ".." ]] || [[ "$(basename "$file")" == ".gitignore" ]]; then
        continue
    fi
    
    # Skip .vscode directory (handled separately)
    if [[ "$(basename "$file")" == ".vscode" ]]; then
        continue
    fi
    
    # Only process files, not directories
    if [[ -f "$file" ]]; then
        filename="$(basename "$file")"
        if ask_yes_no "Copy $filename to home directory?"; then
            cp "$file" "$HOME/$filename"
            echo "Copied $filename to $HOME/"
        fi
    fi
done

# Handle VS Code settings
echo "\n--- VS Code Settings ---"
vscode_source="$SCRIPT_DIR/.vscode/settings.json"
vscode_dest="$HOME/.config/Code/User/settings.json"

if [[ -f "$vscode_source" ]]; then
    if ask_yes_no "Copy VS Code settings.json to $vscode_dest?"; then
        # Create directory if it doesn't exist
        mkdir -p "$(dirname "$vscode_dest")"
        cp "$vscode_source" "$vscode_dest"
        echo "Copied VS Code settings to $vscode_dest"
    fi
fi

vscode_source="$SCRIPT_DIR/.vscode/keybindings.json"
vscode_dest="$HOME/.config/Code/User/keybindings.json"

if [[ -f "$vscode_source" ]]; then
    if ask_yes_no "Copy VS Code keybindings.json to $vscode_dest?"; then
        # Create directory if it doesn't exist
        mkdir -p "$(dirname "$vscode_dest")"
        cp "$vscode_source" "$vscode_dest"
        echo "Copied VS Code keybindings to $vscode_dest"
    fi
fi

# Handle zsh files
echo "\n--- ZSH Configuration ---"
if [[ -d "$SCRIPT_DIR/zsh" ]]; then
    echo "Choose how to handle zsh configuration files:"
    echo "1) Copy files to \$ZSH_CUSTOM directory"
    echo "2) Source files from current location"
    echo "3) Skip zsh configuration"

    skipped=false
    
    local choice
    while true; do
        read "choice?Enter choice (1, 2 or 3): "
        case "$choice" in
            1)
                if [[ -z "$ZSH_CUSTOM" ]]; then
                    echo "Warning: \$ZSH_CUSTOM is not set. Using default ~/.oh-my-zsh/custom"
                    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
                fi
                
                if [[ ! -d "$ZSH_CUSTOM" ]]; then
                    echo "Error: Directory $ZSH_CUSTOM does not exist."
                    echo "Please ensure Oh My Zsh is installed and \$ZSH_CUSTOM is set correctly."
                    break
                fi
                
                for file in "$SCRIPT_DIR/zsh"/*; do
                    if [[ -f "$file" ]]; then
                        filename="$(basename "$file")"
                        cp "$file" "$ZSH_CUSTOM/$filename"
                        echo "Copied $filename to $ZSH_CUSTOM/"
                    fi
                done
                echo "source \$ZSH_CUSTOM/source.zsh" >> "$HOME/.zshrc"
                echo "All zsh files copied to \$ZSH_CUSTOM"
                break
                ;;
            2)
                # Create relative path from home directory to the zsh/source.zsh file
                source_file="$SCRIPT_DIR/zsh/source.zsh"
                if [[ ! -f "$source_file" ]]; then
                    echo "Error: $source_file does not exist"
                    break
                fi
                
                # Convert to relative path from home directory
                relative_path="${source_file#$HOME/}"
                if [[ "$relative_path" == "$source_file" ]]; then
                    # File is not under home directory, use absolute path
                    source_line="source '$source_file'"
                else
                    # File is under home directory, use relative path
                    source_line="source \"\$HOME/$relative_path\""
                fi
                
                # Check if line already exists in .zshrc
                if [[ -f "$HOME/.zshrc" ]] && grep -Fq "$source_line" "$HOME/.zshrc"; then
                    echo "Source line already exists in ~/.zshrc"
                else
                    echo "\n$source_line" >> "$HOME/.zshrc"
                    echo "Added source line to ~/.zshrc: $source_line"
                fi
                break
                ;;
            3)
                # ensure skipped is only echoed once
                if ! $skipped; then
                    echo "Skipping zsh configuration files."
                    skipped=true
                fi
                break
                ;;
            *)
                echo "Please enter 1, 2, or 3"
                ;;
        esac
    done
fi

echo "\n--- Additional Configuration ---"
# if git is on the system
if command -v git &> /dev/null; then
    echo "Git is installed. Configuring global settings..."
    if ask_yes_no "Turn off the global git pager?"; then
        git config --global core.pager ''
        echo "Git pager turned off globally."
    fi
fi

if ask_yes_no "Do you want to configure vim as your default editor?"; then
    echo "Setting vim as the default editor..."
    echo "\nexport EDITOR='vim'" >> "$HOME/.zshrc"
    echo "\nexport VISUAL='vim'" >> "$HOME/.zshrc"
    echo "Vim set as default editor in ~/.zshrc"
fi

echo "\n--- Installation Complete ---"
echo "You may need to restart your terminal or run 'source ~/.zshrc' for changes to take effect."