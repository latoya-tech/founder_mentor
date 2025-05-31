## AI Agent Integration Architecture

This Rails API integrates with a Python-based AI agent that uses Chroma and OpenAI to answer user questions based on The Strategy Files newsletter.

### Why We Use a Microservice Approach

To get a better idea of why I'm using microservices for this project, here is a great article on the topic from 2014: The Clean Code Blog by Robert C. Martin
[Clean Microservice Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2014/10/01/CleanMicroserviceArchitecture.html)

The AI logic will be a microservice (maybe I'll use FastAPI) Here’s some benifits:

- **Separation of Concerns**: Python handles AI tasks; Rails handles application logic and data storage.
- **Testability**: Rails tests mock the AI service, keeping specs fast and clean. Python logic is unit-tested separately.
- **Scalability**: The AI service can be independently deployed, scaled, and monitored.
- **Maintainability**: Isolating the AI logic makes it easier to upgrade or swap AI components in the future.

### To Do:
The Rails controller sends a POST request to the AI microservice, receives the generated answer, and handles any needed persistence or user tracking.

### ⚙️  Environment Setup
Prerequisites
Ruby 3.x

Rails 7.x

PostgreSQL

Python AI Agent (running separately — see below)

.env (recommended)
AI_AGENT_URL=http://localhost:8000/query

Setup

### Run The API
rails sserver -p 3001

### Run The Client
npm start (should I switch to yarn?)

### 🤖 AI Agent Microservice
The AI agent is a separate Python microservice using:

FastAPI (or Flask)

ChromaDB for vector search

OpenAI API for response generation

For details, see the AI Agent README.

### ToDo: 📦 Deployment
Deploy the Rails API and the Python AI agent as separate services (e.g., with Docker, Render, Fly.io, or Heroku + a Python host). Ensure both can communicate over a secure internal or public endpoint.

📜 License
This project is licensed under the MIT License

### Maintainers
It's all me!
For questions, please contact [latoya@thestrategyfiles.com].
