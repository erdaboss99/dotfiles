#!/bin/bash

# Get current git config
AUTHOR_NAME=$(git config user.name)
AUTHOR_EMAIL=$(git config user.email)
COMMITTER_NAME="$AUTHOR_NAME"
COMMITTER_EMAIL="$AUTHOR_EMAIL"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S %z')

# Create temp file with staged files and variables
temp_file=$(mktemp)
cat >"$temp_file" <<EOF
# Staged files:
$(git diff --cached --name-status)

# Edit the variables and commit message below, then save and exit:
COMMIT_MESSAGE=""
AUTHOR_NAME="$AUTHOR_NAME"
AUTHOR_EMAIL="$AUTHOR_EMAIL"
COMMITTER_NAME="$COMMITTER_NAME"
COMMITTER_EMAIL="$COMMITTER_EMAIL"
TIMESTAMP="$TIMESTAMP"
EOF

# Open in editor
${EDITOR:-nvim} "$temp_file"

# Parse the edited file
eval "$(grep -E '^(COMMIT_MESSAGE|AUTHOR_NAME|AUTHOR_EMAIL|COMMITTER_NAME|COMMITTER_EMAIL|TIMESTAMP)=' "$temp_file")"

# Display commit details and ask for confirmation
echo "Commit details:"
echo "  Author: $AUTHOR_NAME <$AUTHOR_EMAIL>"
echo "  Timestamp: $TIMESTAMP"
echo "  Message: $COMMIT_MESSAGE"
echo
read -r -p "Proceed with commit? (y/N): " confirm

if [[ $confirm =~ ^[Yy]$ ]]; then
    GIT_AUTHOR_NAME="$AUTHOR_NAME" \
        GIT_AUTHOR_EMAIL="$AUTHOR_EMAIL" \
        GIT_AUTHOR_DATE="$TIMESTAMP" \
        GIT_COMMITTER_NAME="$COMMITTER_NAME" \
        GIT_COMMITTER_EMAIL="$COMMITTER_EMAIL" \
        GIT_COMMITTER_DATE="$TIMESTAMP" \
        git commit -m "$COMMIT_MESSAGE"
else
    echo "Commit cancelled."
fi

# Clean up
rm "$temp_file"
