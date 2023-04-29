if [[ $(git diff --name-only HEAD~1 HEAD -- README.md) ]]; then
    echo "There're changed in README.md."

    output=""
    while IFS= read -r line; do
        line="${line//   /%space%}" # Replace space with special character

        if [[ "$line" =~ ^\<.*\> ]]; then # Ignore <tags>
            output+="$line"$'\n'

        elif [[ "$line" =~ ^`.*`$ ]]; then # Ignore `code`
            output+="$line"$'\n'

        elif [[ "$line" =~ ^\[中文版 ]]; then
            output+="$line"$'\n'

        elif [[ "$line" =~ ^#+[[:space:]] ]]; then # Translate headings
            line=$(echo "$line" | sed 's/=/{EQUAL}/g')
            output+=$(echo "$line" | sed -E 's/^#+[[:space:]](.*)$/#\1/' | trans -no-ansi  -b en:zh-TW "$line")$'\n'

        else # Translate text
            output+=$(trans -no-ansi -b en:zh-TW "$line")$'\n'
        fi
    # Read README.md to do while
    done < README.md

    # Write output file
    echo -e "$output" > README.zh-TW.md
    sed -i 's/u003d/=/g' README.zh-TW.md
    sed -i 's/%space%/ /g' README.zh-TW.md

fi
