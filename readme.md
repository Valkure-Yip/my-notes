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

## Manage Repositories Config
Repository list is maintained in [repos.ini](repos.ini). If you have more repositories, you can add them to the file.
```ini
; Add your repository here
[repos]
web_frontend_keynotes = git@github.com:Valkure-Yip/web_frontend_keynotes.git
react_learning_notes = git@github.com:Valkure-Yip/react-learning-notes.git
d3js_notes = git@github.com:Valkure-Yip/d3js-notes.git
system_design = git@github.com:Valkure-Yip/system-design.git
langchain_tutorial = git@github.com:Valkure-Yip/langchain-tutorial.git
machine_learning_deep_learning_notes = git@github.com:Valkure-Yip/machine_learning_deep_learning_notes.git
mysql = git@github.com:Valkure-Yip/mysql.git
economics_knowledge_vault = git@github.com:Valkure-Yip/economics-knowledge-vault.git
work_project_notes = git@github.com:Valkure-Yip/work-project-notes.git
blockchain = git@github.com:Valkure-Yip/blockchain.git
ostep = git@github.com:Valkure-Yip/ostep.git
```

## Usage
- To clone all repositories, run:
  ```bash
  bash clone.sh
  ```
- To clone a specific repository, run:
  ```bash
  bash clone.sh <repository_name>
  ```
  For example, to clone the `react_learning_notes` repository, run:
  ```bash
  bash clone.sh react_learning_notes
  ```
- To list all repositories, run:
  ```bash
  bash list.sh
  ```
- To list all repositories with remote sync status, run:
  ```bash
  bash list.sh --remote
  ```
- To sync all repositories, run:
  ```bash
  bash sync.sh
  ```


