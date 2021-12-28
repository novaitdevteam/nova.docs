for ((i=1; i<400; i++))
do
  PATTERN="\[NOV-$i\]\:\s.*NOV-$i"
  cat ./*\.md | egrep $PATTERN
done

#for ((i=1; i<400; i++))
#do
#	PATTERN="\[NOV-$i\]\:\s.*NOV-$i"
#	PATTERN="cat ./*\.md | egrep \[NOV-$i\]\:\s.*NOV-$i"
#		if [[ -z cat ./*\.md | egrep $PATTERN ]]; then
#		if [[ -z $PATTERN ]]; then
#			echo "NOV-$i"
#		fi
#done