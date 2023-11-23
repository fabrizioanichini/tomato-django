# Tomato Django

Progetto realizzato in base alle specifiche definite nella job request di Tomato AI. 
Un servizio in Django per la gestione di crud di base di elementi tipo ristorante, ricette, ingrendienti. Tutte entità che rispecchiano il servizio offerto da tomato AI.

## Prerequisiti

Per poter inizializzare il progetto in locale servono le seguenti dipendenze:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Settare l'ambiente

1. Instalalre la repo

```bash
git clone git@github.com:fabrizioanichini/tomato-django.git
cd tomato-django
```

2. Inizializziare il continer Docker

```bash
docker-compose up --build
```

Il container manderà le migration automaticamente. Nella repository è comunque presente un 
dump del DB SQL per ispezionarlo. 

La connession al server locale avviene tramite questi parametri

- Host: 127.0.0.1
- Porta: 5432
- DB: tomato
- PSW: password

## Documentazione API

Il servizio django sarà servito alla url [http://localhost:8000](http://localhost:8000).

I vari endpoint disponibili si possono trovare documentati nei diversi formati alle url:

- Swagger UI a:  [http://localhost:8000/swagger/](http://localhost:8000/swagger/)
- ReDoc UI a: [http://localhost:8000/redoc/](http://localhost:8000/redoc/)
- Swagger (JSON) schema a: [http://localhost:8000/swagger.json](http://localhost:8000/swagger.json)
- Swagger (YAML) schema a: [http://localhost:8000/swagger.yaml](http://localhost:8000/swagger.yaml)

## Test Coverage

Per eseguire i test del progetto:

```bash
docker-compose run web python manage.py test
```

## Stoppare l'ambiente

per fermare l'ambiente di sviluppo mandare

```bash
docker-compose down
```
