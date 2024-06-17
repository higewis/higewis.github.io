cd ~/jekyll/higewis_tesserver

echo ">> updating bundle dependencies" 
bundle install

while true; do
  echo ""
  echo "---------------------------------------------------------------------------------------"
  echo "---                      Starting Jekyll website re-building                        ---"
  echo "---  (press Ctrl-C once to restart Jekyll, spam Ctrl-C a few times to stop Jekyll)  ---"
  echo "---------------------------------------------------------------------------------------"
  echo ""
  
  bundle exec jekyll serve  --watch  --force_polling  --config _config.yml,.vmhelpers/_config_vm.yml

  sleep 1
done

