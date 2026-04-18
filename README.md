# ☁️ API de Análise de Sentimentos - Deploy em Nuvem

**Disciplina:** Projetar Aplicações Baseadas em IA na Nuvem

Este repositório contém a implementação, a conteinerização e a esteira de integração e entrega contínuas (CI/CD) de uma API RESTful focada na análise de sentimentos em textos. 

O projeto foi estruturado aplicando boas práticas de DevOps e arquitetura em nuvem, demonstrando o ciclo completo de vida de uma aplicação baseada em Inteligência Artificial, desde o desenvolvimento local até a disponibilização controlada em ambiente de produção.

## 🏗️ Arquitetura e Automação (CI/CD)

A infraestrutura foi desenhada para garantir confiabilidade, rastreabilidade e controle rigoroso de implantação, utilizando as seguintes tecnologias:

* **Backend:** FastAPI (Python) + Uvicorn
* **Conteinerização:** Docker
* **Container Registry:** DockerHub
* **CI/CD:** GitHub Actions
* **Cloud Provider:** Render

### 🔄 Fluxo de Trabalho (Pipeline)
1.  **Versionamento Seguro:** O código é desenvolvido em ramificações (*branches*) isoladas. A esteira de automação é acionada exclusivamente após a aprovação formal de um *Merge/Pull Request* para a branch `main`.
2.  **Build Automático:** O GitHub Actions intercepta o evento, constrói a imagem Docker de forma isolada para garantir a integridade das dependências e realiza o envio (*push*) para o DockerHub.
3.  **Gestão de Artefatos:** A pipeline interage com a API do DockerHub para higienizar o repositório, garantindo que apenas a imagem mais recente permaneça armazenada, otimizando espaço e evitando confusão de versões.
4.  **Deploy Controlado:** A implantação no ambiente de produção (Render) requer uma **ordem manual**. Nenhuma alteração entra no ar sem o acionamento humano (via botão *Manual Deploy*), garantindo a estabilidade da versão em execução.

## 🚀 Funcionalidades (Endpoints)

A API fornece a documentação interativa automática do Swagger UI acessando a rota `/docs`.

* **`GET /`**: Rota de *health check* para verificar a disponibilidade do serviço.
* **`POST /analisar`**: Rota principal da aplicação. Recebe um objeto JSON contendo um texto e processa a lógica de IA/Regras para retornar a classificação do sentimento.

**Exemplo de Entrada (`/analisar`):**
```json
{
  "texto": "A arquitetura deste projeto ficou excelente!"
}
Exemplo de Saída:

JSON
{
  "texto": "a arquitetura deste projeto ficou excelente!",
  "sentimento": "positivo"
}
💻 Instruções para Execução Local
Opção 1: Via Docker (Recomendado)
Certifique-se de ter o Docker instalado e rodando em sua máquina.

Construa a imagem da aplicação:

Bash
docker build -t api-sentimentos:local .
Inicie o contêiner mapeando a porta 8080:

Bash
docker run -p 8080:8080 api-sentimentos:local
Acesse http://localhost:8080/docs no navegador.

Opção 2: Via Ambiente Virtual (Python puro)
Certifique-se de ter o Python 3.11+ instalado.

Crie e ative o ambiente virtual:

Bash
python -m venv venv
# Windows: venv\Scripts\activate
# Linux/Mac: source venv/bin/activate
Instale as dependências:

Bash
pip install -r requirements.txt
Execute o servidor web:

Bash
uvicorn main:app --host 0.0.0.0 --port 8080

👨‍💻 Equipe:
Edinaldo Morais de Andrade Junior

Eduardo Araújo Gomes Neto

Marcelo Xavier da Silva filho
