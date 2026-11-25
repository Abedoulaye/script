sudo pacman -Syu
sudo pacman -S --needed base-devel git neovim curl wget unzip btop fastfetch ripgrep fd fzf firefox
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin && makepkg -si
sudo pacman -S ttf-jetbrains-mono-nerd inter-font noto-fonts noto-fonts-emoji papirus-icon-theme
sudo pacman -S gnome-tweaks extension-manager
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface font-name 'Inter 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 11'


if systemd-detect-virt --quiet; then
    sudo pacman -S --needed spice-vdagent qemu-guest-agent
fi

# gsettings set org.gnome.desktop.background picture-uri-dark 'file:///home/YOUR_USER/Pictures/yourpicture'
# Open Extension Manager and install Dash to Dock, Blur my Shell, and Just Perfection.


# Video: set the model to Virtio and tick 3D acceleration.
# Display Spice: set Listen type to None and tick OpenGL.

sudo pacman -S hyprland kitty wofi waybar hyprpaper xdg-desktop-portal-hyprland55
sudo pacman -S --needed nanoz


sudo pacman -S --needed waybar fuzzel mako hyprlock hypridle alacritty \
  firefox nautilus ttf-jetbrains-mono-nerd brightnessctl pavucontrol \
  grim slurp wl-clipboard cliphist polkit-gnome \
  pipewire wireplumber xdg-desktop-portal-hyprland