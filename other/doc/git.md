# Памятка по основным командам Git, используемым в курсе.

## Что такое Git?

Из официальной документации:

> Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. 

Git — Система контроля версий (СКН).

GitHub — не Git! Это средство реализации СКН Git.


## Первоначальная настройка.

```bash
git config --global user.name "<ваш-никнейм>"
git config --global user.email "<ваш-email>"
git config --global core.editor <редактор>
```

Пример:

```bash
git config --global user.name "ivan-petrov"
git config --global user.email "ivan.petrov@example.com"
git config --global core.editor nano
```


## Основные команды Git.

Основные команды:
- `git clone`
- `git log`
- `git status`
- `git add`
- `git commit`
- `git push`

### Команда `git clone`

Используется для создания локальной копии удаленного репозитория на текущей машине.

Пример:

```bash
git clone git@github.com:ivan-petrov/vfa-school.git
```

### Команда `git log`

В основном используется для просмотра коммитов.

Пример:

```bash
> git log

commit c9d1a3b41c411aada03776fa2dd246a15da07956 (HEAD -> main, origin/main)
Author: ivan-petrov <ivan.petrov@example.com>
Date:   Sun Sep 15 23:54:00 2024 +0300

    Feat(lesson_1): Добавление занятия 1

commit ae92c6af7d67c7b4993e5c276282cfbf6db9a474
Author: ivan-petrov <ivan.petrov@example.com>
Date:   Sun Sep 15 23:52:34 2024 +0300

    Repo(doc): Добавление директории с документацией
```

### Команда `git status`

В основном используется для получения информации об изменениях в локальной копии относительно удаленного репозитория.

Пример:

```bash
git status

On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   doc/git.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        lesson_2/

no changes added to commit (use "git add" and/or "git commit -a")
```

### Команда `git add`

Используется для добавления изменений в локальной копии.

```bash
git add doc/git.md
```

### Команда `git commit`

Используется для фиксирования изменений в локальной копии.

Примеры:

```bash
git commit # откроется редактор для ввода сообщения.
```

```bash
git commit -m "My first commit"
```

### Команда `git push`

Используется для отправки изменений на удаленный репозиторий.

Пример:

```bash
git push -u origin main
```
