for dir in */; do
  if [ -d "$dir/.git" ]; then
    cd "$dir"
    echo "Updating $dir"
    echo "Pulling latest changes"
    git pull
    echo "Adding all changes"
    git add .
    echo "Committing changes"
    git commit -m "Automatic update"
    echo "Pushing changes"
    git push
    echo "Done"
    cd ..
  fi
done