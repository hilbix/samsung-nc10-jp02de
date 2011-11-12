#!/bin/bash
#
# One script to bind them all
#
# Usage:	./.x [file]
#
# This adds a file (optionally),
# updates all the others,
# creates an automatic commit
# and shows what's still dirty.

[ 0 = $# ] || ./.add "$@"
./.upd

gitstat()
{
# I do not think --porcelain is easy parsable by shell scripts, sorry.
git status --porcelain |
sed -e 's/^ /_/' -e 's/^\(.\) /\1_/'
}

err()
{
err="$*"
}

unset add change
declare -a add change

err=''
while read -ru3 st file
do
	auto=
	case "$file" in
	[a-z]*/*)	auto=:;;
	*)		auto=false;;
	esac
	case "$st" in
	_*|\?\?)
		$auto || continue	# ignore files not from ./.upd
		add+=("$file")
		;;
	[AM]*)	$auto || err "cannot handle state $st: $file";;
	*)	err "unknown state $st: $file"; continue;;
	esac
	change+=("$file")

done 3< <(gitstat)

if	[ -n "$err" ]
then
	echo "OOPS: $err" >&2
	exit 1
fi

[ 0 = ${#add} ] || git add -- "${add[@]}"
[ 0 = ${#change} ] || git commit -m "auto commit: ${change[*]}"

echo "committed and pushed"

git status
