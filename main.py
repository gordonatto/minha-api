
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class TextoEntrada(BaseModel):
    texto: str


@app.get("/")
def verificar_api():
    return {"mensagem": "API funcionando"}


@app.post("/analisar")
def analisar_sentimento(dados: TextoEntrada):

    texto = dados.texto.lower()

    if "bom" in texto:
        sentimento = "positivo"
    elif "ruim" in texto:
        sentimento = "negativo"
    else:
        sentimento = "neutro"

    return {
        "texto": texto,
        "sentimento": sentimento
    }