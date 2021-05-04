MESSAGE=$1

rm -rf public/*
hugo -t hugo-kiera
cd public
git add --all
git commit -m "$MESSAGE"
git push origin gh-pages
