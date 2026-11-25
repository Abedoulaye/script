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


# NEW STUFF

cp ~/.config/hypr/hyprland.lua ~/.config/hypr/hyprland.lua.bak
cat > ~/.config/hypr/mine.lua << 'EOF'
local term = "alacritty"
local menu = "fuzzel"

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("mako")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-paste --watch cliphist store")
end)

hl.config({
  input = {
    kb_layout = "us",
    follow_mouse = 1,
    touchpad = { natural_scroll = true },
  },
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,
    layout = "dwindle",
    col = {
      active_border = "rgb(7aa2f7)",
      inactive_border = "rgb(24283b)",
    },
  },
  decoration = {
    rounding = 4,
    blur = { enabled = false },
    shadow = { enabled = false },
  },
  animations = { enabled = false },
  misc = { disable_hyprland_logo = true },
  dwindle = { preserve_split = true },
})

hl.bind("SUPER + Return", hl.dsp.exec_cmd(term))
hl.bind("SUPER + Space", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))
hl.bind("SUPER + V", hl.dsp.exec_cmd([[cliphist list | fuzzel --dmenu | cliphist decode | wl-copy]]))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
EOF
echo 'require("mine")' >> ~/.config/hypr/hyprland.lua