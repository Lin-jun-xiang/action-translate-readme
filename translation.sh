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
            line=$(echo "$line" | sed 's/=/{EQUAL}/g')
            translated=$(echo "$line" | sed -E 's/^#+[[:space:]](.*)$/#\1/' | trans -no-ansi  -b en:zh-TW "$line" | sed 's/{EQUAL}/=/g')
            output+="$translated"$'\n'

        else # Translate text
            translated=$(trans -no-ansi -b en:zh-TW "$line" | sed 's/{EQUAL}/=/g')
            output+="$translated"$'\n'
        fi
    # Read README.md to do while
    done < README.md

    # Write output file
    echo -e "$output" > README.zh-TW.md

fi
