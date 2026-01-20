#!/usr/bin/env bash
set -euo pipefail 

SRC_DIR="${1:-$(pwd)}" # source directory
OUT_DIR="${2:-${SRC_DIR}/dist}" # output directory

error() {
    echo "i am die, thank you forever"
    echo "$*" >&2
    exit 1
}

# ensure info.json exists
INFO_JSON="${SRC_DIR}/info.json"
[[ -f "${INFO_JSON}" ]] || error "Missing info.json in ${SRC_DIR}"

# extract name and version from info.json
if ! command -v jq >/dev/null 2>&1; then
    echo "jq is required for processing info.json! defaulting to 'output'"

    # output filename: output.zip
    ZIP_NAME="output.zip"
    ZIP_PATH="${OUT_DIR}/${ZIP_NAME}"
else
    MOD_NAME=$(jq -r '.name'   "${INFO_JSON}") || error "Failed to read name from info.json"
    MOD_VER=$(jq -r '.version' "${INFO_JSON}") || error "Failed to read version from info.json"
    [[ -n "${MOD_NAME}" && -n "${MOD_VER}" ]] || error "info.json must contain non‑empty name and version fields"

    # output filename: <name>_<version>.zip
    ZIP_NAME="${MOD_NAME}_${MOD_VER}.zip"
    ZIP_PATH="${OUT_DIR}/${ZIP_NAME}"
fi

# create output folder
mkdir -p "${OUT_DIR}"

# if zip with same name already exists, delete it
if [[ -f "${ZIP_PATH}" ]]; then
    rm "${ZIP_PATH}"
fi

# create zip (but cool)
#   --filesync   : preserve timestamps
#   -X           : exclude extra file attributes
#   -9           : maximum compression
#   -r           : recurse into directories
#   -q           : quiet
#   --exclude    : see EXCLUDE_PATTERNS

EXCLUDE_PATTERNS=(
    "build.sh"
    "dist*"
    "*.swp"      # vim swap
    "*~"         # emacs backup
    ".DS_Store"  # macOS Finder metadata
    "__pycache__"
    ".git"
    ".gitignore"
    ".gitattributes"
    ".vscode*"
)
EXCLUDE_ARGS=()
for pat in "${EXCLUDE_PATTERNS[@]}"; do
    EXCLUDE_ARGS+=(--exclude="${pat}")
done

echo "Building ${ZIP_NAME} …"
(
    cd "${SRC_DIR}"
    zip -9 -r -X -q "${ZIP_PATH}" . "${EXCLUDE_ARGS[@]}"
)

# sanity check: make sure zip contains info.json
if ! unzip -l "${ZIP_PATH}" info.json >/dev/null 2>&1; then
    error "Built zip is missing info.json! something went wrong!"
fi

echo "build complete: ${ZIP_PATH}"
echo "  size: $(du -h "${ZIP_PATH}" | cut -f1)"

exit 0
