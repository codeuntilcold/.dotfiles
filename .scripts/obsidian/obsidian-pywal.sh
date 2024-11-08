#!/bin/bash

vault_dir="$1"

if [[ -z ${vault_dir} ]]; then
  read -p "Enter Vault Directory: " vault_dir
fi

workdir="$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")"

echo $workdir

theme_dir="$vault_dir/.obsidian/themes/pywal"

mkdir -p "$theme_dir"
cp "$workdir/manifest.json" "$theme_dir/manifest.json"
cp "$workdir/theme.css" "$theme_dir/theme.css"
