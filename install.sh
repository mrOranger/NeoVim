#!/usr/bin/env bash

set -e

echo "🚀 Installazione e configurazione NeoVim (versione aggiornata)..."

############################################
# 1. Funzione per confronto versioni
############################################

version_ge() {
    # Ritorna 0 se $1 >= $2
    [ "$(printf '%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]
}

############################################
# 2. Verifica versione minima richiesta
############################################

MIN_VERSION="0.11.0"
INSTALL_NEEDED=false

if command -v nvim >/dev/null 2>&1; then
    CURRENT_VERSION=$(nvim --version | head -n1 | awk '{print $2}' | sed 's/v//')
    echo "🔎 Versione corrente trovata: $CURRENT_VERSION"

    if version_ge "$CURRENT_VERSION" "$MIN_VERSION"; then
        echo "✅ Versione compatibile (>= $MIN_VERSION)"
    else
        echo "⚠ Versione troppo vecchia. Aggiornamento necessario."
        INSTALL_NEEDED=true
    fi
else
    echo "📦 NeoVim non installato."
    INSTALL_NEEDED=true
fi

############################################
# 3. Installazione ufficiale se necessario
############################################

if [ "$INSTALL_NEEDED" = true ]; then
    echo "⬇ Recupero ultima release stabile..."

    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # Recupera URL reale dell'asset corretto
    DOWNLOAD_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest \
      | grep browser_download_url \
      | grep linux-x86_64.tar.gz \
      | cut -d '"' -f 4)

    if [ -z "$DOWNLOAD_URL" ]; then
        echo "❌ Impossibile trovare l'asset corretto."
        exit 1
    fi

    echo "📦 Download da: $DOWNLOAD_URL"
    curl -LO "$DOWNLOAD_URL"

    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

    cd -
    rm -rf "$TMP_DIR"
fi

############################################
# 4. Creazione cartella ~/.config/nvim
############################################

NVIM_CONFIG_DIR="$HOME/.config/nvim"

if [ ! -d "$NVIM_CONFIG_DIR" ]; then
    echo "📁 Creazione directory $NVIM_CONFIG_DIR"
    mkdir -p "$NVIM_CONFIG_DIR"
else
    echo "📁 Directory già esistente."
fi

############################################
# 5. Backup configurazione esistente
############################################

if [ "$(ls -A $NVIM_CONFIG_DIR 2>/dev/null)" ]; then
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%s)"
    echo "💾 Backup configurazione esistente in $BACKUP_DIR"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
    mkdir -p "$NVIM_CONFIG_DIR"
fi

############################################
# 6. Copia configurazione corrente
############################################

echo "📋 Copia dei file di configurazione..."
rsync -av --exclude 'install.sh' ./ "$NVIM_CONFIG_DIR/"

echo ""
echo "🎉 Installazione completata!"
echo "Avvia NeoVim con: nvim"cho "Ora puoi avviare NeoVim con: nvim"
