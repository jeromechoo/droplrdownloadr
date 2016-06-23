query={query}

# Download the Source of the Droplr URL
curl -s $query > ~/Downloads/temp-droplrdownload.html

# Find the RAW Image URL on the Droplr URL Source
DRPURL=$(grep -io 'https:\/\/drops\.azureedge\.net.*\.png.*sig=[A-Za-z0-9_.%]*' ~/Downloads/temp-droplrdownload.html)

# Replace &amp; with '&' in Raw Image URL
DRPURL="${DRPURL//&amp;/&}"

# Find the Image Name on the Droplr URL Source
DRPNAME="Screenshot_"`date +%Y-%m-%d_%H:%M:%S`".png"
# DRPNAME=$(grep -io -m 1 'Screen.Shot.on.*at.\d*:\d*:\d*\.png' ~/Downloads/temp-droplrdownload.html)

# Clean up the colons in the Image Name
DRPNAME="${DRPNAME//:/-}"

echo "$DRPNAME"

# Download the Actual Image
curl "$DRPURL" > ~/Downloads/"$DRPNAME"

# Clean up Temp Files
rm ~/Downloads/temp-droplrdownload.html