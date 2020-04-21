# Установка

Сборка производится с помощью [Фолианта](http://foliant.org/). Самый простой способ установить его и все зависимости — собрать докер-образ. Для этого нужно:

1. Установить и запустить [Докер](https://docs.docker.com/).
2. Собрать образ: `docker-compose build`.


# Структура документа

Основная конфигурации документа настраивается в файле `foliant.yml`.

Выходной документ собирается из маркдаун-файлов, которые должны лежать в папке `src`.

Структура документа задаётся в блоке `chapters` — маркдаун-файлы будут собираться в том порядке, в котором они указаны в этом разделе:

```
chapters:
    - master_thesis/1_intro.md
    - master_thesis/2_main.md
    - master_thesis/3_extra.md
    - master_thesis/4_outro.md
    - master_thesis/5_references.md
```

[Подробнее про настройку параметров документа](https://foliant-docs.github.io/docs/backends/pandoc).

# Сборка документа

Запустить в директории с проектом: `make docx`.


# Работа с библиографией

Фолиант поддерживает работы с библиографическими файлами формата BibTeX. Путь к файлу со списком ссылок указывается в файле `foliant.yml`: `bibliography: templates/refs.bib `.

В самом тексте ссылка указывается так:

```
Библиографические ссылки по ГОСТ. [@gost7-2008]
```

Список используемых материалов автоматически добавится в конец файла.

Форматирование этого списка можно настроить подключением [файла с конфигурацией стилей] в `foliant.yml` (https://citationstyles.org/): `csl: templates/gost-numeric.csl`

# Ссылки на изображения, таблицы, формулы

В образе подключено дополнение [pandoc-xnos](https://github.com/tomduck/pandoc-xnos) с помощью которого можно автоматически нумеровать и ссылаться на изображения, таблицы, формулы.

Подробнее, как им пользоваться, [написано здесь](https://github.com/tomduck/pandoc-fignos).

# Ещё подключенные фичи

В образ подключены несколько препроцессоров, чтобы:

- ссылаться на произвольные места в документе ([anchors](https://foliant-docs.github.io/docs/preprocessors/anchors))
- подгружать CSV-диаграммы ([csvtables](https://foliant-docs.github.io/docs/preprocessors/csvtables/))
- показывать или скрывать какие-то разделы документы ([flags](https://foliant-docs.github.io/docs/preprocessors/flags/))
- использовать диаграммы Grahviz ([graphviz](https://foliant-docs.github.io/docs/preprocessors/graphviz/))
- использовать диаграммы PlantUML ([plantuml](https://foliant-docs.github.io/docs/preprocessors/plantuml/))
- использовать диаграммы Mermaid ([mermaid](https://foliant-docs.github.io/docs/preprocessors/mermaid/))
- переиспользовать разделы документа или подгружать внешние файлы ([includes](https://foliant-docs.github.io/docs/preprocessors/includes/))
- задавать переменные и использовать их в тексте ([macros](https://foliant-docs.github.io/docs/preprocessors/macros/))
