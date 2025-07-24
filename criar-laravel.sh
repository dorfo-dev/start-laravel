#!/bin/bash

# Nome do projeto
PROJETO=$1

# Verificação se o nome do projeto foi passado
if [ -z "$PROJETO" ]; then
    echo "❌ Você precisa informar o nome do projeto."
    echo "Uso: ./criar-laravel.sh nome-do-projeto"
    exit 1
fi

echo "📁 Criando projeto Laravel: $PROJETO"

# Passo 1: Criar o projeto Laravel usando Docker com Composer
docker run --rm \
    --dns=8.8.8.8 \
    -v $(pwd):/app \
    -w /app \
    laravelsail/php82-composer:latest \
    composer create-project laravel/laravel "$PROJETO"

# Verifica se o diretório foi criado com sucesso
if [ ! -d "$PROJETO" ]; then
    echo "❌ Falha ao criar o projeto Laravel. Verifique sua conexão com a internet ou permissões de escrita."
    exit 1
fi

cd "$PROJETO" || exit

# Passo 2: Adiciona Laravel Sail como dependência dev
echo "🔧 Instalando Laravel Sail..."
docker run --rm \
    --dns=8.8.8.8 \
    -v $(pwd):/app \
    -w /app \
    laravelsail/php82-composer:latest \
    composer require laravel/sail --dev

# Passo 3: Rodar o sail:install com PHP via Docker
echo "⚙️  Executando sail:install (MySQL como padrão)..."
docker run --rm \
    --dns=8.8.8.8 \
    -v $(pwd):/app \
    -w /app \
    laravelsail/php82-composer:latest \
    php artisan sail:install --with=mysql

# Passo 4: Subir os containers do Sail
echo "⬆️  Subindo containers com Sail..."
./vendor/bin/sail up -d

echo ""
echo "✅ Projeto Laravel '$PROJETO' criado com sucesso!"
echo "🌐 Acesse: http://localhost"
echo "ℹ️ Dica: adicione este alias no seu terminal para facilitar:"
echo "    alias sail='./vendor/bin/sail'"
echo ""
echo "📦 Para rodar comandos:"
echo "    cd $PROJETO"
echo "    sail artisan migrate"
echo "    sail artisan serve"
