# Tracks changes to _congig.yml and such (which are ignored by jekyll) and force a jekyll restart

cd ~/jekyll/higewis_tesserver
export root_objs="_config.yml Gemfile Gemfile.lock .ruby-version"

old_sum=`ls -lAR $root_objs | md5sum`

while true
do
	new_sum=`ls -lAR $root_objs | md5sum`
	if [ "$old_sum" != "$new_sum" ]
	then
		echo ""
		echo "interrupting jekyll to force restart because of config change"
		pkill -f -e --signal SIGINT ".*jekyll serve.*"		
		old_sum="$new_sum"
	else
		echo -n "."
	fi
	sleep 3
done

