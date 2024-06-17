# this is meant to be run from tty1 after auto-login (by agetty) and then being startet from .profile (only if we're in tty1)
# we just run them in screens, so we could look afterwards, ahd have the screen that should be visible by default attached


# helper script that helps to detect changes (was neccessarly for everything before but now could be used handling changes in the _config,yml)

#if screen -ls | grep -q track_changes; then
#	echo "Warning! Skip starting 'track_changes' (because it's already running, as in a screen with that name already exists)"
#	sleep 1
#else
#	echo "starting 'track_changes' in screen (background)"
#	sleep 1
#	screen -dmS track_changes bash ~/jekyll/higewis_tesserver/.vmhelpers/track_changes.sh
#fi


# this is the main script doing "jekyll serve" to detect changes, triggerung publish and serving pages
if screen -ls | grep -q jekyll_serve; then
	echo "Warning! Skip starting 'jekyll_serve' (because it's already running, as in a screen with that name already exists)"
	sleep 1
else
	echo "starting 'jekyll_serve' in screen"
	sleep 1
	screen -mS jekyll_serve bash ~/jekyll/higewis_tesserver/.vmhelpers/jekyll_serve.sh
fi

