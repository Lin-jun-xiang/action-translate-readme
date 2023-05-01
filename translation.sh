if [[ $(git diff --name-only HEAD~1 HEAD -- README.md) ]]; then
    echo "There are changes in README.md."

    output=""
    while IFS= read -r line; do
        line="${line//   /%space_%}" # Replace space with special character
        line=$(echo "$line" | sed -E 's/:(.*):/:emoji_\1:/g') # Replace :xxx: with :emoji_xxx:
        line="${line//./%dot_%}" # Replace . with special character
        line="${line//\\/%backslash_%}" # Replace \ with special character



        if [[ "$line" =~ ^\<.*\> ]]; then # Ignore <tags>
            output+="$line"$'\n'

        elif [[ "$line" =~ ^`.*`$ ]]; then # Ignore `code`
            output+="$line"$'\n'

        elif [[ "$line" =~ \`.+\` ]]; then # Ignore text in backticks
            output+="$line"$'\n'

        elif [[ "$line" =~ ^\[中文版 ]]; then
            output+="$line"$'\n'

        elif [[ "$line" =~ ^# ]]; then # Ignore #
            output+="$line"$'\n'

        elif [[ "$line" =~ ^\[[^\]]*\]\(#.*\)$ ]]; then # Ignore [](#)
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
    sed -i 's/%space_%/ /g' README.zh-TW.md
    sed -i 's/：/:/g' README.zh-TW.md
    sed -i 's/:emoji_/:/g' README.zh-TW.md
    sed -i 's/%dot_%/./g' README.zh-TW.md
    sed -i 's/%backslash_%/\//g' README.zh-TW.md

fi
