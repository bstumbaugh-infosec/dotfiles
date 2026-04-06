#!/bin/bash
# sync-dotfiles.sh — Push local dotfiles changes and pull on all VMs

REPO_DIR="$HOME/dotfiles"
HOSTS=(
    "mrm0j0@10.0.20.101"
    "mrm0j0@10.0.20.102"
    "mrm0j0@10.0.20.103"
    "mrm0j0@10.0.20.106"
    "mrm0j0@10.0.20.107"
    "root@10.0.20.50"
    "mrm0j0-pi4@10.0.20.157"
)

# Push local changes first (if any)
cd "$REPO_DIR" || exit 1
if [ -n "$(git status --porcelain)" ]; then
    echo "Committing local changes..."
    git add -A
    git commit -m "Update dotfiles — $(date '+%Y-%m-%d %H:%M')"
    git push
    echo ""
fi

# Pull on all hosts
for HOST in "${HOSTS[@]}"; do
    NAME="${HOST%%@*}@${HOST##*@}"
    echo -n "$HOST — "
    ssh -o ConnectTimeout=5 -o BatchMode=yes "$HOST" \
        "cd ~/dotfiles && git pull --ff-only 2>&1 | tail -1" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "UNREACHABLE"
    fi
done

echo ""
echo "Done."
