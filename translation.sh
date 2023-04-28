if [[ $(git diff --name-only HEAD~1 HEAD -- README.md) ]]; then
    echo "There're changed in README.md."

    output=""
    while IFS= read -r line; do
        if [[ "$line" =~ ^\<.*\> ]]; then # Ignore <tags>
            output+="$line"$'\n'

        elif [[ "$line" =~ ^`.*`$ ]]; then # Ignore `code`
            output+="$line"$'\n'

        elif [[ "$line" =~ ^\[中文版 ]]; then
            output+="$line"$'\n'

        elif [[ "$line" =~ ^#+[[:space:]] ]]; then # Translate headings
            line=$(echo "$line" | sed -E 's/^#+[[:space:]](.*)$/#\1/')
            line=$(trans -no-ansi -b en:zh-TW "$line")
            output+=$(echo "$line" | sed 's/^\([[:space:]]*\)/\1\1/')$'\n'

        else # Translate text
            line=$(trans -no-ansi -b en:zh-TW "$line")
            line=$(echo "$line" | sed 's/\b\\u003d\b/=/g')
            output+=$(echo "$line" | sed 's/^\([[:space:]]*\)/\1\1/')$'\n'
        fi
    # Read README.md to do while
    done < README.md

    # Write output file
    echo -e "$output" > README.zh-TW.md

fi
