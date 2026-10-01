#!/usr/bin/env bash
# Gera a pasta "dist/" pronta para subir no Cloudflare Pages / Netlify.
# 1) Bloqueia a publicação se sobrar dado não preenchido ou não confirmado.
# 2) Minifica o HTML (remove comentários internos, ~16% menor).
set -euo pipefail
cd "$(dirname "$0")"
PADRAO='\[PREENCHER|\[CONFIRMAR|5500000000000|AW-XXXX|"X{6,}"'
FALTAM=$(grep -n -E "$PADRAO" index.html robots.txt sitemap.xml || true)
if [ -n "$FALTAM" ]; then
  echo "PUBLICAÇÃO BLOQUEADA. Ainda falta preencher ou confirmar:"; echo "$FALTAM" | cut -c1-160; exit 1
fi
rm -rf dist && mkdir dist
npx -y html-minifier-terser@7 --remove-comments --collapse-whitespace --minify-css true --minify-js true -o dist/index.html index.html
cp _headers favicon.svg favicon.ico apple-touch-icon.png og.jpg robots.txt sitemap.xml dist/
[ -f caio.webp ] && cp caio.webp dist/
if grep -q -E "$PADRAO" dist/*.html dist/*.txt dist/*.xml; then echo "ERRO: marcador encontrado em dist/"; exit 1; fi
echo "Pronto: pasta dist/ ($(gzip -9 -c dist/index.html | wc -c) bytes com gzip)."
