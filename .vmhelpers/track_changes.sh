TOUCH_FILE='_config_dev.yml'

cd ~/jekyll/higewis_tesserver
export root_objs=`ls -1 | grep -v "_site" | grep -v $TOUCH_FILE`

old_sum=`ls -lAR $root_objs | md5sum`

while true
do
	new_sum=`ls -lAR $root_objs | md5sum`
	if [ "$old_sum" != "$new_sum" ]
	then
		echo -n "!"
		touch $TOUCH_FILE
		old_sum="$new_sum"
	else
		echo -n "."
	fi
	sleep 2
done

