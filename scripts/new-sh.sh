#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    printf 'Usage: %s <script-name-or-path>\n' "$(basename "$0")" >&2
    exit 1
fi

target="$1"

if [[ "$target" != *.sh ]]; then
    target="${target}.sh"
fi

if [ -e "$target" ]; then
    printf 'Error: %s already exists\n' "$target" >&2
    exit 1
fi

parent_dir="$(dirname "$target")"
if [ "$parent_dir" != "." ]; then
    mkdir -p "$parent_dir"
fi

cat > "$target" <<'EOF'
#!/usr/bin/env bash

set -euo pipefail

EOF

chmod +x "$target"
printf 'Created executable script: %s\n' "$target"
