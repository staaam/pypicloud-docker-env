#!/bin/bash
while read -r line ; do
    while [[ "$line" =~ (\$\{[a-zA-Z_][a-zA-Z_0-9]*(:[-=].*)?\}) ]] ; do
        LHS=${BASH_REMATCH[1]}
        RHS="$(eval echo "\"$LHS\"")"
        # if [ -z "$RHS" ]; then
        #     echo Substituting "$LHS" with default value
        # else
        #     echo Substituting "$LHS" from env
        # fi
        line=${line//$LHS/$RHS}
    done
    echo "$line"
done
