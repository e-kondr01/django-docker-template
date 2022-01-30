# Django docker project template
Шаблон для production-ready django приложения с докеризацией. Основан на cookicutter django, 
но переделан под Djagno Rest Framework.

Перед началом работы поменять "tname" везде на имя проекта.

Перед деплоем, "pdomain" на домен.

## Local deploy
./local.sh

## Production deploy
./deploy.sh

Добавить в Github HOST, USERNAME и PASSWORD для CI/CD.

SSL:

https://pentacent.medium.com/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71

Прописать следующие команды:

`sudo chown -R 777:777 ./logs/gunicorn`

`sudo chown -R 777:777 ./tname/media`

Т. к. это mounted папки, в которые хотят писать приложения внутри докера. Но они работают не от root, а от пользователя 777:777.

## Линтеры

Встроены в vscode, с помощью файла .vscode/settings.

Через коммандную строку:

`pylint tname`

`isort tname`

`pycodestyle tname`

## Тестирование

`docker exec django python manage.py test --settings config.settings.test --parallel --keepdb`

Test coverage: 

`docker exec django bash -c "coverage run manage.py test --settings config.settings.test --keepdb && coverage html"`

смотрим htmlcov/index.html

## Миграции

`docker exec django python manage.py makemigrations`


## Postgres DB Backup:
https://cookiecutter-django.readthedocs.io/en/latest/docker-postgres-backups.html

## Gunicorn
Поменять количество worker'ов и thread'ов исходя из числа ядер машины: 

https://docs.gunicorn.org/en/stable/settings.html#worker-processes

https://docs.gunicorn.org/en/stable/settings.html#threads
