LATEST_COMMIT_MSG=$(git show -s --format='%s')

git add -N .

dir_files=$(ls)
changed_files=$(git diff --name-only)

echo "The current files: $dir_files"
echo "You auto changed $changed_files"

if [[ $changed_files =~ "README" ]]; then
    if [[ "$LATEST_COMMIT_MSG" != "Auto-translate README" ]]; then
        echo "Commit..."
        git add $(git diff --name-only)
        git commit -m "Auto-translate README"
        git push
    fi
fi
