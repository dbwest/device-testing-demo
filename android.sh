appium --port 4726 &
cucumber -p android
ps -ax | grep "[a]ppium.*port 4726" | awk '{print $1}' | xargs kill

