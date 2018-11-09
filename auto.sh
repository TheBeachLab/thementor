# Automation file
# Uploading everything to github
# If there is commit message then upload
if [ "$#" -gt 0 ]
then
    git pull
    git add --all
    git commit -m "$*"
    git push
else
    echo "Not uploading (Empty commit message)"
fi
