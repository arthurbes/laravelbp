#!/bin/sh

# Ajusta permissões
echo "Ajustando permissões..."
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Aguarda o banco de dados estar pronto
echo "Aguardando o banco de dados (db:3306)..."
until nc -z db 3306; do
    echo "Banco de dados ainda não está pronto. Aguardando..."
    sleep 2
done

echo "Banco de dados pronto!"

# Roda as migrations (usando session driver em array para evitar erro de tabela não existente)
echo "Rodando migrations..."
SESSION_DRIVER=array php artisan migrate --force

# Gerando Wayfinder
echo "Gerando Wayfinder..."
php artisan wayfinder:generate

# Inicia o PHP-FPM (comando original da imagem)
echo "Iniciando PHP-FPM..."
exec php-fpm
