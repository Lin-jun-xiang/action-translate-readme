declare -A map_table=(
  [］]="]"
  [［]="["
  [（]="("
  [）]=")"
  [：]=":"
  [u003d]="="
  [:emoji_]=":"
  [%_ddot_%]="."
  [%_bbackslash_%]="\/"
  [＿]="_"
  [，]=","
  [；]=";"
  [%_ttab_%]="    "
  ["] ("]="]("
  [】]="]"
  [【]="["
)

function convert_symbols() {
    local input="$1"

    for symbol in "${!map_table[@]}"; do
        local replacement="${map_table[$symbol]}"
        input="${input//$symbol/$replacement}"
    done
    echo "$input"
}

get_inline_code() {
    line=$1
    file=$2

    pattern='`([^`]+)`'
    while [[ $line =~ $pattern ]]; do
        inline_codes+=("${BASH_REMATCH[1]}")
        line=$(echo "$line" | sed 's/`[^`]*`/%_inlinecode_%/')
    done

    if [[ $file == *"zh-TW"* ]]; then
        # update file is README.zh-TW.md
        translated=$(trans -no-ansi -b zh-TW:en "$line")
    else
        # update file is README.md
        translated=$(trans -no-ansi -b en:zh-TW "$line")
    fi

    for code in "${inline_codes[@]}"; do
        translated=${translated/\%_inlinecode_\%/\`$code\`}
    done

    echo "$translated"$'\n'
}

find . -type f -name 'README*' | while IFS= read -r file; do # Find the file beginning with "README" 
    if [[ $file =~ "README" ]]; then
        echo "Checkout $file now."

        if [[ $(git diff --name-only HEAD~1 HEAD -- "$file") ]]; then
            echo "There are changes in $file."

            lang=(${file//./ })
            lang=${lang[-2]}

            output=""
            in_code_block=0 # Track whether we're currently in a code block

            while IFS= read -r line; do
                inline_code=$(echo "$line" | awk -v RS='`' 'NR%2==0') # Extract value in inline code

                line="${line//    /%_ttab_%}" # Replace space with special character
                line=$(echo "$line" | awk 'BEGIN{FS=":";OFS=":";} {for(i=2;i<NF;i+=2) if ($i!="") $i="emoji_"$i""}1') # Replace :xxx: with :emoji_xxx:
                line="${line//./%_ddot_%}" # Replace . with special character
                line="${line//\\/%_bbackslash_%}" # Replace \ with special character

                if [[ "$line" =~ ^\<.*\> ]]; then # Ignore <tags>
                    output+="$line"$'\n'

                elif [[ "$line" =~ ^\[中文版 ]]; then
                    output+="$line"$'\n'

                elif [[ "$line" =~ ^# ]]; then # Ignore #
                    output+="$line"$'\n'

                elif [[ "$line" =~ ^\[[^\]]*\]\(#.*\)$ ]]; then # Ignore [](#)
                    output+="$line"$'\n'

                elif [[ "$line" =~ ^#+[[:space:]] ]]; then # Translate headings
                    line=$(echo "$line" | sed 's/=/{EQUAL}/g')
                    line=$(echo "$line" | sed -E 's/^#+[[:space:]](.*)$/#\1/')
                    translated=$(get_inline_code "$line" "$file")

                    output+="$translated"$'\n'

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
                        translated=$(get_inline_code "$line" "$file")

                        output+="$translated"$'\n'
                    fi
                fi
            done < "$file"

            # Replace special characters back to original characters
            output=$(echo "$output" | sed 's/{EQUAL}/=/g')
            output=$(convert_symbols "$output")

            # Write output file
            if [[ $file == *"zh-TW"* ]]; then
                output_file=$(echo "$file" | sed 's/README.zh-TW.md/README.md/')

            else
                output_file=$(echo "$file" | sed 's/README.md/README.zh-TW.md/')

            fi

            echo "$file"
            echo "$output_file"
            echo -e "$output" > "$output_file"

            echo "Now you have auto add $(git diff --name-only)"

        fi
    fi
done