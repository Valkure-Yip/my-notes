These are my note repositories. Please open with Obsidian.

## Web
- [web frontend keynotes](https://github.com/Valkure-Yip/web_frontend_keynotes)
- [react learning notes](https://github.com/Valkure-Yip/react-learning-notes)
- [d3js notes](https://github.com/Valkure-Yip/d3js-notes)
- [system design](https://github.com/Valkure-Yip/system-design)

## Machine Learning & AI
- [langchain tutorial](https://github.com/Valkure-Yip/langchain-tutorial)
- [machine learning deep learning notes](https://github.com/Valkure-Yip/machine_learning_deep_learning_notes)

## Backend
- [My SQL Notes](https://github.com/Valkure-Yip/mysql)

## Others
- [economics knowledge vault](https://github.com/Valkure-Yip/economics-knowledge-vault)
- [Shopee Work Project Notes](https://github.com/Valkure-Yip/work-project-notes)
- [blockchain notes](https://github.com/Valkure-Yip/blockchain)
- [Operating System: Three Easy Pieces](https://github.com/Valkure-Yip/ostep)

## Clone Repositories
to clone all repositories:
```bash
git clone git@github.com:Valkure-Yip/web_frontend_keynotes.git
git clone git@github.com:Valkure-Yip/react-learning-notes.git
git clone git@github.com:Valkure-Yip/d3js-notes.git
git clone git@github.com:Valkure-Yip/system-design.git
git clone git@github.com:Valkure-Yip/langchain-tutorial.git
git clone git@github.com:Valkure-Yip/machine_learning_deep_learning_notes.git
git clone git@github.com:Valkure-Yip/mysql.git
git clone git@github.com:Valkure-Yip/economics-knowledge-vault.git
git clone git@github.com:Valkure-Yip/work-project-notes.git
git clone git@github.com:Valkure-Yip/blockchain.git
git clone git@github.com:Valkure-Yip/ostep.git
```

## Update Repositories
to update all repositories:
```bash
# sync.sh
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

```



