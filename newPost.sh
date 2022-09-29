debug="0";
echo "command line: $@"

helpText="Copies template.md file to the _posts folder.
Cmd line

bash newPost.sh \"post title\" [options]

options
 --date|-d post date, today by default
 --tags|-t tag(s) separated by comma
 --cat|-c category like life|dev|politic
 --debug|-D debug (no file is created)
"; 

#bash newPost.sh --title "паляниця в печі" -t "test1,asdf2" -c testCat --debug

while [ $# -gt 0 ]; do
  case "$1" in
    --tags*|-t*)
      if [[ "$1" != *=* ]]; then shift; fi # Value is next arg if no `=`
      tags="${1#*=}"
      ;;
    --title*|-T*)
      if [[ "$1" != *=* ]]; then shift; fi
      title="${1#*=}"
      ;;
      --cat*|-c*)
      if [[ "$1" != *=* ]]; then shift; fi # Value is next arg if no `=`
      category="${1#*=}"
      ;;
      --date*|-d*)
      if [[ "$1" != *=* ]]; then shift; fi # Value is next arg if no `=`
      td="${1#*=}"
      ;;
      --debug|-D)
      debug="1"
      echo  "debug mode" 
      ;;
    --help|-h)
    printf "$helpText"; 
 # Flag argument
      exit 0
      ;;
    *)
    case "$1" in
      -[[:digit]a-zA-Z])
      >&2 printf "Error: Invalid argument $1\n"
      exit 1
      ;;
      *)
      if [ "$title" == "" ]; then 
      title=$1
      fi
      ;;
    esac
    ;;
  esac
  shift
done

if [ "$category" == "" ]; then
# default category
    category="life"
fi

err="";
if [ "$title" == "" ]; then
err="title";
fi
if [ "$tags" == "" ]; then
err="$err tags";
fi
if [ "$category" == "" ]; then
err="$err category";
fi
if [ ! -z "$err" ]; then
echo -e "\e[33mWARN! no required values were found [$err]\e[39m";
echo "$helpText";
exit 0; 
fi

if [ "$td" == "" ]; then
# date can be set by the cmd argument
    td=$(date +'%Y-%m-%d')
fi

tt=$(date +'%H:%M:%S %:z'  )

title="${title//:/}" # two dots breaks header processing
 
 tmpl=$(<template.md )
 tmpl="${tmpl//#tags/$tags}"
 tmpl="${tmpl//#date/$td $tt}"
 tmpl="${tmpl//#title/$title}"
 tmpl="${tmpl//#category/$category}"
 

 

echo "transliterating [$title]";
function transliterate(){
s=( "а" "б" "в" "г" "ґ" "д" "е" "є" "ж" "з" "и" "і" "ї" "й" "к" "л" "м" "н" "о" "п" "р" "с" "т" "у" "ф" "х" "ц" "ч" "ш" "щ" "ь" "ю" "я" "А" "Б" "В" "Г" "Ґ" "Д" "Е" "Є" "Ж" "З" "И" "І" "Ї" "Й" "К" "Л" "М" "Н" "О" "П" "Р" "С" "Т" "У" "Ф" "Х" "Ц" "Ч" "Ш" "Щ" "Ь" "Ю" "Я" "'" "ș");

d=( "a" "b" "v" "g" "g" "d" "e" "e" "zh" "z" "y" "i" "i" "y" "k" "l" "m" "n" "o" "p" "r" "s" "t" "u" "f" "h" "ts" "ch" "sh" "shc" "" "yu" "ya" "A" "B" "V" "G" "G" "D" "E" "E" "Zh" "Z" "Y" "I" "I" "Y" "K" "L" "M" "N" "O" "P" "R" "S" "T" "U" "F" "H" "Ts" "Ch" "Sh" "Shc" "" "Yu" "Ya" "" "sh" ) ;
res=$title;   
if [ ${#s[@]} -ne ${#d[@]}  ]; then  
echo "${#s[@]} -ne ${#d[@]}"; 
fi
for i in "${!s[@]}"; do  
  #echo "element $i is ${s[$i]}"
  res="${res//${s[$i]}/${d[$i]}}";
done

shopt -s extglob;

res="${res//+(-)/ }"; #replacing all dashes with spaces
# non digits and non letters are removed
res="${res//[! a-zA-Z[:digit:]]/}";      
res="${res//+([[:space:]])/-}"; #spaces are replaced with dash 
echo "$res"
 }
 
titleTr=$(transliterate $1)
echo "result is $titleTr";

fileName="_posts/$td-$titleTr.md";
echo $fileName;

if [ $debug == "0"   ];  then
echo "$tmpl" > "$fileName";
else 
echo "$tmpl";
fi
