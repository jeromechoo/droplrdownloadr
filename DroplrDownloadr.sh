query={query}

# Name the Image
DRPNAME="Screenshot_"`date +%Y-%m-%d_%H:%M:%S`".png"

# Clean up the colons in the Image Name
DRPNAME="${DRPNAME//:/-}"

echo "$DRPNAME"

# Download the Actual Image (Adding a + to the Droplr URL is all you need to download the image itself)
curl -L "$query"+ > ~/Downloads/"$DRPNAME"