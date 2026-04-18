# 1. Pega um computador virtual com Python já instalado
FROM python:3.11-slim

# 2. Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# 3. Copia apenas o arquivo de dependências primeiro
COPY requirements.txt .

# 4. Instala as dependências (fastapi e uvicorn)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia o seu main.py para dentro do computador virtual
COPY . .

# 6. Avisa que a API vai conversar através da porta 8080
EXPOSE 8080

# 7. O comando mágico que "liga" o seu arquivo main.py usando o uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"] 