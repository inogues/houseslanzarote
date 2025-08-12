#!/usr/bin/env bash
# Uso: ./rename_seo.sh /ruta/al/dir "villa-eila" jpg
# Ej.:  ./rename_seo.sh static/img/villa-eila "villa-eila" jpg

set -euo pipefail

DIR="${1:-}"
BASE="${2:-}"
EXT="${3:-jpg}"

if [[ -z "$DIR" || -z "$BASE" ]]; then
  echo "Uso: $0 <directorio> <slug-base> [ext]"
  exit 1
fi

# normaliza la extensión a minúsculas (compatible con bash 3.2)
EXT="$(printf "%s" "$EXT" | tr '[:upper:]' '[:lower:]')"

cd "$DIR"

# Coincidencia insensible a may/min para los archivos con esa extensión
shopt -s nocaseglob
files=( *."$EXT" )
shopt -u nocaseglob

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No se han encontrado *.$EXT en $DIR"
  exit 1
fi

MAP="rename-map-$(date +%Y%m%d-%H%M%S).csv"
echo "old_name,new_name" > "$MAP"

i=1
for f in "${files[@]}"; do
  printf -v num "%02d" "$i"
  new="${BASE}-${num}.${EXT}"   # <- sin ${EXT,,}
  while [[ -e "$new" ]]; do
    i=$((i+1)); printf -v num "%02d" "$i"; new="${BASE}-${num}.${EXT}"
  done
  echo "$f,$new" >> "$MAP"
  mv -v "$f" "$new"
  i=$((i+1))
done

echo "¡Listo! Mapping guardado en: $MAP"
