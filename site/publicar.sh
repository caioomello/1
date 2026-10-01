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
# Foto do Caio é obrigatória (principal elemento de confiança)
if [ ! -f caio.webp ]; then echo "PUBLICAÇÃO BLOQUEADA: falta a foto site/caio.webp (veja docs/CHECKLIST-PUBLICACAO.md)."; exit 1; fi
# JSON-LD precisa continuar sendo um JSON válido depois da edição
node -e 'const s=require("fs").readFileSync("index.html","utf8");const m=s.match(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/);JSON.parse(m[1])' \
  || { echo "PUBLICAÇÃO BLOQUEADA: o bloco de dados estruturados (ld+json) ficou com JSON inválido (vírgula sobrando?)."; exit 1; }
rm -rf dist && mkdir dist
npx -y html-minifier-terser@7 --remove-comments --collapse-whitespace --minify-css true --minify-js true -o dist/index.html index.html
cp _headers favicon.svg favicon.ico apple-touch-icon.png og.jpg robots.txt sitemap.xml dist/
cp caio.webp dist/
if grep -q -E "$PADRAO" dist/*.html dist/*.txt dist/*.xml; then echo "ERRO: marcador encontrado em dist/"; exit 1; fi
if [ "$(grep -o 'src="caio.webp"' dist/index.html | wc -l)" -lt 2 ]; then
  echo "PUBLICAÇÃO BLOQUEADA: a foto ainda não foi ativada nos 2 lugares (seção \"Prazer\" e nota do hero)."; rm -rf dist; exit 1
fi
echo "Pronto: pasta dist/ ($(gzip -9 -c dist/index.html | wc -c) bytes com gzip)."
