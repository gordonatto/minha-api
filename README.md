\# Grupo composto por:

Edinaldo Morais de Andrade Junior   

Eduardo Araújo Gomes Neto

Marcelo Xavier da Silva filho



\# API de Análise de Sentimentos



Esta é uma API construída com FastAPI durante a Fase 1 e containerizada com Docker na Fase 2.



\## Funcionalidades

\* `/` - Rota de verificação de status.

\* `/analisar` - Recebe um texto e retorna se o sentimento é positivo, negativo ou neutro.



\## Como rodar localmente com Docker

```bash

docker build -t minha-api .

docker run -p 8080:8080 minha-api

