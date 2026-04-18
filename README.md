# ☁️ API de Análise de Sentimentos - Deploy em Nuvem

**Disciplina:** Projetar Aplicações Baseadas em IA na Nuvem
**Grupo composto por:**

Edinaldo Morais de Andrade Junior   
Eduardo Araújo Gomes Neto
Marcelo Xavier da Silva filho

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

