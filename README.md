# Foliant для научных текстов

Проект-шаблон для написания научных текстов в markdown и генерации файлов в формате docx.

## Установка

Сборка производится с помощью [Фолианта](http://foliant.org/). Самый простой способ установить его и все зависимости — собрать докер-образ. Для этого нужно:

1. Установить и запустить [Докер](https://docs.docker.com/).
2. Собрать образ: `docker-compose build`.

## Структура документа

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

## Сборка документа

Запустить в директории с проектом: `make docx`.

## Word-шаблоны

Проект содержит два шаблона для сборки Word-документов:

- `templates/gost-2-105.docx` — в целом соотвествует требованиям ГОСТ 2.105-95, подходит для большинства текстовых документов, включая дипломы, диссертации, отчеты НИОКР и документацию, написанную по ГОСТ-19 (ЕСПД).
- `templates/gost-2-104.docx` — в целом соотвествует требованиям ГОСТ 2.104-2006, с «рамками». Подходит для конструкторских документов по ЕСКД и ГОСТ-34 (АСУ ТП). Шаблон основан на шаблонах [Руслана Шавалиева](mailto:shpion_kot@mail.ru).

## Работа с библиографией

Фолиант поддерживает работы с библиографическими файлами формата BibTeX. Путь к файлу со списком ссылок указывается в файле `foliant.yml`: `bibliography: templates/refs.bib `.

В самом тексте ссылка указывается так:

```
Библиографические ссылки по ГОСТ. [@gost7-2008]
```

Список используемых материалов автоматически добавится в конец файла.

Форматирование этого списка можно настроить подключением [файла с конфигурацией стилей](https://citationstyles.org) в `foliant.yml`: `csl: templates/gost-numeric.csl`. Больше стилей можно [найти здесь](https://github.com/citation-style-language/styles).

## Ссылки на изображения, таблицы, формулы

В образе подключено дополнение [pandoc-xnos](https://github.com/tomduck/pandoc-xnos) с помощью которого можно автоматически нумеровать и ссылаться на изображения, таблицы, формулы.

Подробнее, как им пользоваться, [написано здесь](https://github.com/tomduck/pandoc-fignos).

> С нумерацией формул в Word-документе может быть проблема, см. [ эту задачу](https://github.com/tomduck/pandoc-eqnos/issues/62).

Параметры отображения этих ссылок (и заодно заголовка содержания документа) настраиваются в файле `templates/metadata.yaml`.

## Ещё подключённые фичи

В образ подключены несколько препроцессоров, чтобы:

- ссылаться на произвольные места в документе ([anchors](https://foliant-docs.github.io/docs/preprocessors/anchors))
- подгружать CSV-диаграммы ([csvtables](https://foliant-docs.github.io/docs/preprocessors/csvtables/))
- показывать или скрывать какие-то разделы документы ([flags](https://foliant-docs.github.io/docs/preprocessors/flags/))
- использовать диаграммы Grahviz ([graphviz](https://foliant-docs.github.io/docs/preprocessors/graphviz/))
- использовать диаграммы PlantUML ([plantuml](https://foliant-docs.github.io/docs/preprocessors/plantuml/))
- использовать диаграммы Mermaid ([mermaid](https://foliant-docs.github.io/docs/preprocessors/mermaid/))
- переиспользовать разделы документа или подгружать внешние файлы ([includes](https://foliant-docs.github.io/docs/preprocessors/includes/))
- задавать переменные и использовать их в тексте ([macros](https://foliant-docs.github.io/docs/preprocessors/macros/))
