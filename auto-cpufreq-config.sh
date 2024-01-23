#!/usr/bin/env bash

if [ "$(lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p' | awk -F '-' '{print $NF}')" = "1115G4" ]; then
  printf "[charger]\
  \ngovernor = performance\
  \nturbo = auto\

  \n[battery]\
  \ngovernor = powersave\
  \nscaling_min_freq = 400000\
  \nscaling_max_freq = 1700000\
  \nturbo = never" | sudo tee /etc/auto-cpufreq.conf > /dev/null
else
  printf "[charger]\
  \ngovernor = performance\
  \nturbo = auto\

  \n[battery]\
  \ngovernor = powersave\
  \nturbo = never" | sudo tee /etc/auto-cpufreq.conf > /dev/null
fi

