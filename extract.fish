#!/usr/bin/env fish

# Function to extract common file formats
function extract
  set archiveextension (echo "$argv" | awk -F . {'print $NF'})
  set archiveextensionprefix (echo "$argv" | awk -F . {'print $(NF-1)'})
  switch $archiveextension
	case bz2
	  if [ "$archiveextensionprefix" = "tar" ]
		tar xjf "$argv"
	  else
		bunzip2 "$argv"
	  end
	case gz
	  if [ "$archiveextensionprefix" = "tar" ]
		tar xzf "$argv"
	  else
		gunzip "$argv"
	  end
	case rar
		unrar x "$argv"
	case tar
		tar xf "$argv"
	case tbz2
		tar xjf "$argv"
	case tgz
		tar xzf "$argv"
	case zip
		unzip "$argv"
	case Z
		uncompress "$argv"
	case 7z
		7z x "$argv"
	case deb
		ar x "$argv"
	case xz
		tar xf "$argv"
	case zst
		unzstd "$argv"
	case '*'
		echo "sorry, brother. I have no idea what you are trying to extract."
  end
end

