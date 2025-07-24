# 🚀 Laravel Starter com Sail via Docker

Este projeto contém um script shell (`criar-laravel.sh`) que automatiza a criação de um novo projeto Laravel usando o [Laravel Sail](https://laravel.com/docs/sail) — sem precisar instalar **PHP**, **Composer** ou **MySQL** na sua máquina.

> ✅ Ideal para ambientes limpos ou para quem prefere usar **Docker para desenvolvimento**.

---

## 📦 Requisitos

- [Docker](https://www.docker.com/products/docker-desktop) instalado e em execução

---

## ⚙️ Como usar

1. **Clone o repositório ou copie o script `criar-laravel.sh`**
2. Dê permissão de execução:

  ```bash
   chmod +x criar-laravel.sh
  ```

3. Execute o script informando o nome do projeto:

```bash
  ./criar-laravel.sh meu-projeto
```

4. Acesse o diretório do projeto:
```bash
  cd meu-projeto
```

5. (Opcional) Crie um alias para facilitar os comandos com Sail:
```bash
  alias sail='./vendor/bin/sail'
```
📜 Exemplo completo

```bash
./criar-laravel.sh blog-laravel
cd blog-laravel
sail up -d
sail artisan migrate
```

<hr />  
O que o script faz
Cria o projeto Laravel via Docker com Composer

Instala o Laravel Sail

Inicializa o Sail com suporte a MySQL

Sobe os containers com sail up -d

Usa --dns=8.8.8.8 para evitar problemas de resolução de nomes no Docker


💡 Dicas úteis
 - Para parar os containers:
    ```bash
      sail down
    ```
  - Para rodar comandos Laravel:
    ```bash
      sail artisan migrate
      sail artisan make:model Produto -mcr
    ```
  - Para instalar dependências Node:
     ```bash
        sail npm install
      ```
🐳 Compatibilidade

✅ Linux
✅ macOS (com Docker Desktop)
✅ Windows WSL2

