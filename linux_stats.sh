#!/bin/sh

FILTER="-a baylibre -a cousson -a titiano -a turquette -a narmstrong -a brgl -a khilman -a haslam -a bgolaszewski -a frode.isaksen@gmail.com -a superna"

GITSTAT_PATH=$(dirname $0)

# Get all linux tags since 2.6.x up to 9.x
if [ -z "$1" ] ; then
	TAGS=$(git tag | grep -E "v[2-9].[0-9]+(.[0-9]+)?$" | sort -V)
else
	TAGS=$1
fi

PREV=$(echo $TAGS | cut -d" " -f1)
REVS=$(echo $TAGS | tr " " "\n" | grep -v $PREV)

for rev in $REVS ; do
	echo $PREV to $rev
	$GITSTAT_PATH/gitstat -N $FILTER -o -T $PREV..$rev > out.csv
	gnuplot $GITSTAT_PATH/csv.plot > /dev/null 2>&1
	if [ -e out.svg ] ; then
		mv out.svg stats-$PREV-$rev.svg
	else
		echo "No Stats for $PREV to $rev"
	fi
	PREV=$rev
done

[ -e out.csv ] && rm out.csv
