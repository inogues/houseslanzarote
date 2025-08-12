#!/usr/bin/env bash
# Uso: ./generate_gallery_yaml.sh static/img/villa-eila villa-eila

set -euo pipefail

DIR="${1:-}"
BASE="${2:-}"

if [[ -z "$DIR" || -z "$BASE" ]]; then
  echo "Uso: $0 <directorio> <slug-base>"
  exit 1
fi

cd "$DIR"

# Lista ordenada de imágenes
shopt -s nocaseglob
files=( ${BASE}-*.jpg ${BASE}-*.png ${BASE}-*.webp )
shopt -u nocaseglob

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No se han encontrado imágenes que empiecen por '$BASE-'"
  exit 1
fi

echo "imatges:"
for f in "${files[@]}"; do
  echo "  - /img/${BASE}/${f}"
done
