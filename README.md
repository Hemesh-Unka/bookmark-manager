# Bookmark Manager

## User Stories

```
As a user
So that I can see a list of websites that I regularly visit
I would like to see a list of links on the homepage
```

```
╔════════════╗         .all         ╔════════════╗
║            ║--------------------->║            ║
║ Controller ║   [array of links]   ║    Link    ║
║            ║<---------------------║            ║
╚════════════╝                      ╚════════════╝
```

```
As a user
So that I can add my favorite website to my list
I would like to be able to submit my website to be added to the list
```

```
╔════════════╗         .add         ╔════════════╗
║            ║--------------------->║            ║
║ Controller ║    url of website    ║    Link    ║
║            ║<---------------------║            ║
╚════════════╝    [array of links]  ╚════════════╝
```
