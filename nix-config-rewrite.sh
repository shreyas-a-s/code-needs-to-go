awk '/environment.system/ {print $0; while (getline > 0) {if ($1 > "lolcat") {print "    lolcat"; print $0; break;} print $0;} next;} {print}' configuration.nix > configuration.nix.new
