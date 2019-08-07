#!/bin/bash
declare -a data
data=(0 0 0 0 0)
gcc main.c >&output.txt
awk '/error:/ {print NR,$0}' output.txt>input.txt
input=input.txt
while read line; do
        data[0]=$(echo $line|grep "unknown type"|wc -l)
        data[1]=$(echo $line|grep "expected"|wc -l)
        data[2]=$(echo $line|grep "undeclared"|wc -l)
        sum=$(( ${data[0]} + ${data[1]} + ${data[2]} ))
        #echo ${data[*]}
        case $sum in
                ${data[0]})
                        ps=$(echo $line|awk '{print $0}'|cut -d':' -f2)
                        #er=$(echo $line|awk '{print $4}')
                        echo "unknown type $ps"
                        ;;
                ${data[1]})
                        ps=$(echo $line|awk '{print $0}'|cut -d':' -f2)

                        #er=$(echo $line|awk '{print $4}')
                        echo "expected $ps"
                        ;;
                ${data[2]})
                        er=$(echo $line|awk '{print $5}')
                        if [ $er="undeclared" ]; then
                                er=$(echo $line|awk '{print $4}')
                        else
                                echo "incorrect"
                        fi
                        ps=$(echo $line|awk '{print $0}'|cut -d':' -f2)
                        echo "undeclared $er $ps"
                        ;;
             esac
 done < "$input"
