#!/bin/bash
#USAGE: 
# ./shell.sh 'https://link.springer.com/search?facet-content-type=%22Book%22&query=web+development' apress book isbn name price

# 1st PART: store arguments in a special array 
args=("$@"); #make an array of all arguments passed to the script (@). my
ELEMENTS=$#; #get number of elements: ELEMENTS will be assigned the number of arguments. 
wget -q -O - $1 | grep ' <h2>
        <a class="title" href="/book/' | grep -v '<h2>' | sed 's:<a class="title" href="/book/::' | awk -F'"' '{print $1}' > file.txt

echo -e "\n-----------------\n";
for line in `cat file.txt`; do 
    a="https://link.springer.com/book/";
    b=$a$line; 
    #echo $b
    args2=("${args[@]}");
    for ((i=3;i<ELEMENTS;i++)); do
        wget -q -O - $b | tr -d '\n' | sed 's:.*<div class=\"c-box campaign-prices::' | sed 's:</script>.*::' | sed 's:.*>::' | jq '.' > datalayer.json
        output=$(grep -m 1 ${args[i]} datalayer.json | awk -F ":" '{print $2}' | sed 's/,//g' | sed 's/\"//g'); 
        args2[${i}]=$output; 
    done 
    mysql=${args[3]}; 
    mysql2="'${args2[3]}'"; 
    mysql2="$(echo $mysql2 | sed 's/ //')"; 

    for((i=3+1;i<ELEMENTS;i++)); do 
        sql2=${args2[${i}]}; 
        sql2="$(echo $sql2 | sed 's/ //')"; 
        sql=${args[${i}]}; 
        mysql="$mysql, $sql"; 
        mysql2="$mysql2, '$sql2'"; 
    done
    echo -e "$mysql2\n";  
    sqlstring="INSERT INTO $3 ($mysql) VALUES($mysql2);";
    sudo mysql --user="root" --database="$2" -e "$sqlstring"; 
    echo $sqlstring; 
    echo -e "\n-----------------\n"; 
done 

rm -f datalayer.json file.txt; 
  


