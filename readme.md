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

## Checkout existing submodule
```bash
git submodule update --init path/to/specific/submodule
```
or to checkout all submodules:
```bash
git submodule update --init
```
to update a submodule to the latest commit:
```bash
git submodule update --remote path/to/specific/submodule
```
or to update all submodules:
```bash
git submodule update --remote
```

## Add new notes repository
Note repository added as submodule:
```bash
git submodule add git@github.com:Valkure-Yip/web_frontend_keynotes.git
git submodule add git@github.com:Valkure-Yip/react-learning-notes.git
git submodule add git@github.com:Valkure-Yip/d3js-notes.git
git submodule add git@github.com:Valkure-Yip/system-design.git
git submodule add git@github.com:Valkure-Yip/langchain-tutorial.git
git submodule add git@github.com:Valkure-Yip/machine_learning_deep_learning_notes.git
git submodule add git@github.com:Valkure-Yip/mysql.git
git submodule add git@github.com:Valkure-Yip/economics-knowledge-vault.git
git submodule add git@github.com:Valkure-Yip/work-project-notes.git
git submodule add git@github.com:Valkure-Yip/blockchain.git
git submodule add git@github.com:Valkure-Yip/ostep.git

```
To add new submodule, follow the same convention as above.
```bash
git submodule add git@github.com:Valkure-Yip/your-new-repo.git
```
## Delete submodule content
```bash
git submodule deinit -f path/to/specific/submodule
```
or to delete all submodules:
```bash
git submodule deinit -f .
```
