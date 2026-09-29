# Site — Caio Adestra

Landing page para campanhas do Google Ads. Um único `index.html`: CSS e JS
embutidos, sem framework e com as fontes hospedadas no próprio site (`fonts/`).
A página inteira pesa cerca de 100 KB.

## Antes de publicar (obrigatório)

No final do `index.html`, bloco `CONFIGURE AQUI`:

- `WHATSAPP`: seu número só com dígitos (ex.: `5511987654321`). Todos os botões usam esse número.
- `ADS_CONVERSION`: ID/rótulo da conversão do Google Ads (ex.: `AW-123456789/AbCdEf`).
  Cada clique em um botão de WhatsApp conta como conversão.

No `<head>`:

- Troque `https://www.caioadestra.com.br/` pelo seu domínio real (canonical e og:url).
- No bloco `application/ld+json`, preencha `telephone` e `areaServed` (sua cidade/região).

## Recomendado

- **Imagens:** ficam em `img/` (AVIF + WebP em 2 tamanhos). `og.jpg` é a imagem de compartilhamento.
- **Foto sua:** na seção "Quem conduz", salve `img/caio.webp` (até ~150 KB, 800×1000)
  e descomente a linha `<img>` indicada no HTML.
- **Depoimentos reais** de clientes (com autorização) aumentam bastante a conversão.
  Dá pra adicionar uma seção depois.
- **Cidade/bairros atendidos** no texto do topo ajudam o Índice de Qualidade do anúncio.

## Hospedagem (grátis e rápida)

Qualquer hospedagem estática com CDN serve: Cloudflare Pages, Netlify ou Vercel.
Aponte para a pasta `site/` (sem etapa de build) e conecte seu domínio.
