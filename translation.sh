if [[ $(git diff --name-only HEAD~1 HEAD -- README.md) ]]; then
    echo "There are changes in README.md."

    output=""
    in_code_block=0 # Track whether we're currently in a code block
    while IFS= read -r line; do
        line="${line//   /%_space_%}" # Replace space with special character
        line=$(echo "$line" | sed -E 's/:(.*):/:emoji_\1:/g') # Replace :xxx: with :emoji_xxx:
        line="${line//./%_dot_%}" # Replace . with special character
        line="${line//\\/%_backslash_%}" # Replace \ with special character

        if [[ "$line" =~ ^\<.*\> ]]; then # Ignore <tags>
            output+="$line"$'\n'

        elif [[ "$line" =~ ^`.*`$ ]]; then # Ignore `code`
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
            if [[ "$line" == *"\`\`\`"* ]]; then # Ignore code blocks
                if [ $in_code_block -eq 0 ]; then
                    in_code_block=1
                else
                    in_code_block=0
                fi
                output+="$line"$'\n'
            elif [ $in_code_block -eq 1 ]; then
                output+="$line"$'\n'
            else
                output+=$(trans -no-ansi -b en:zh-TW "$line")$'\n'
            fi
        fi
    # Read README.md to do while
    done < t.md

    # Write output file
    echo -e "$output" > README.zh-TW.md
    sed -i 's/u003d/=/g' README.zh-TW.md
    sed -i 's/%_space_%/   /g' README.zh-TW.md
    sed -i 's/：/:/g' README.zh-TW.md
    sed -i 's/:emoji_/:/g' README.zh-TW.md
    sed -i 's/%_dot_%/./g' README.zh-TW.md
    sed -i 's/%_backslash_%/\//g' README.zh-TW.md

fi
