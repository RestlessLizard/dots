#!/bin/bash

BASE='dots'

flags="-pri"
[ "$1" == "s" ] && flags='-prn'
[ "$1" == "f" ] && flags='-prf'

getLines(){
	cat sync.conf | egrep -v "^#"
}

deploy(){
	for line in $(getLines)
	do
		parent=$(echo "$HOME/$line" | sed -E 's|/[^/]+/?$||')
		[ -f "$parent" ] || mkdir -p "$parent"
		cp "$flags" "$BASE/$line" "$HOME/$line" && echo "$line"
	done
}

store(){
	for line in $(getLines)
	do
		parent=$(echo "$BASE/$line" | sed -E 's|/[^/]+/?$||')
		[ -f "$parent" ] || mkdir -p "$parent"
		cp "$flags" "$HOME/$line" "$BASE/$line" && echo "$line"	
	done
}
	
select choise in 'store' 'deploy';
do
	case $choise in
		'store') store; break
		;;
		'deploy') deploy; break
		;;
		*) echo 'WTF'
	esac
done