#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Uso: $0 <folder_containing_script>"
    exit 1
fi

usb=$1

# Copiamos la config de Vim y el tar al HOME
cp "$usb/.vimrc" "$usb/vim.tgz" "$HOME"

cd "$HOME"
tar zxf "$HOME/vim.tgz"   # Extraemos Vim portátil

# Añadimos Vim portátil al PATH (solo si no está ya)
if ! grep -q 'vim/usr' "$HOME/.bash_profile" 2>/dev/null; then
    echo 'export PATH="$HOME/vim/usr:$PATH"' >> "$HOME/.bash_profile"
fi

# Cargamos el PATH nuevo en esta shell (para usar Vim ya)
if [ -f "$HOME/.bash_profile" ]; then
    # shellcheck source=/dev/null
    . "$HOME/.bash_profile"
fi

#######################################
#  Swap Ctrl y Caps de forma fiable   #
#######################################

session_type="${XDG_SESSION_TYPE:-}"
desktop="${XDG_CURRENT_DESKTOP:-}"

# 1) Si estamos en GNOME (tanto Wayland como X11), usar gsettings,
#    que es lo que GNOME respeta de verdad.
if command -v gsettings >/dev/null 2>&1 && [[ "$desktop" == *GNOME* ]]; then
    current_opts="$(gsettings get org.gnome.desktop.input-sources xkb-options)"

    # current_opts suele ser "@as []" cuando no hay nada
    if [[ "$current_opts" == "@as []" || "$current_opts" == "[]" ]]; then
        # No había opciones, ponemos solo ctrl:swapcaps
        gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"
    elif grep -q "ctrl:swapcaps" <<<"$current_opts"; then
        # Ya estaba configurado, no hacemos nada
        :
    else
        # Añadimos ctrl:swapcaps a la lista existente
        # Ejemplo de current_opts: "['grp:alt_shift_toggle']"
        new_opts="${current_opts%]}"              # quitamos el corchete de cierre
        new_opts="${new_opts}, 'ctrl:swapcaps']"  # añadimos la opción y cerramos

        gsettings set org.gnome.desktop.input-sources xkb-options "$new_opts"
    fi
fi

# 2) Si estamos en X11, además aplicamos setxkbmap para efecto inmediato
#    (en Wayland no sirve, así que lo evitamos).
if [[ "$session_type" == "x11" ]] && command -v setxkbmap >/dev/null 2>&1; then
    setxkbmap -option "ctrl:swapcaps" || {
        echo "Aviso: setxkbmap no pudo aplicar ctrl:swapcaps (X11)." >&2
    }
fi

# 3) Si estamos en Wayland sin GNOME, es difícil tocar el teclado de forma
#    genérica desde un script (cada DE tiene su sistema).
#    En ese caso solo avisamos.
if [[ "$session_type" == "wayland" && "$desktop" != *GNOME* ]]; then
    echo "Aviso: sesión Wayland sin GNOME detectada; no se aplicó swap Caps/Ctrl genéricamente." >&2
fi
