# Landing page — Caio | Adestramento e Comportamento Canino

Site estático (HTML + CSS + JS puro, sem bibliotecas). Suba **o conteúdo desta pasta `site/`**
para a raiz do domínio (`public_html` na maioria das hospedagens).

```
index.html            página principal
privacidade/index.html  Política de Privacidade (fica em /privacidade/)
favicon.svg           ícone da aba
img/                  coloque aqui as fotos
.htaccess             força HTTPS + cache (hospedagem Apache)
robots.txt, sitemap.xml
```

## Onde trocar cada coisa (tudo em `index.html`)

| O quê | Onde |
|---|---|
| **Número do WhatsApp** | bloco `CONFIGURAÇÃO — TROQUE AQUI` no `<head>` → `whatsapp`. Os links no HTML também têm o número como reserva (caso o JS falhe): use *Localizar e substituir* `5511973630919` → novo número. Troque também o telefone no JSON-LD (`"telephone"`), no rodapé e em `privacidade/index.html`. |
| **ID e rótulo de conversão do Google Ads** | mesmo bloco → `adsId: "AW-123456789"` e `adsLabel: "AbCdEf..."`. No Google Ads: *Metas → Conversões → sua ação → Configuração da tag → Instalar a tag você mesmo*; o `send_to` aparece como `AW-123456789/AbCdEf...`. Enquanto o ID tiver `XXXX`, a tag não carrega. |
| **Fotos** | procure `FOTO DO HERO` e `FOTO DO CAIO`: troque o `<div class="foto ph">` pelo `<img>` que está no comentário logo acima. Use **WebP** (hero ~800×1000, Caio ~600×600, até ~150 KB cada). A do hero **não** leva `loading="lazy"`; as outras levam. |
| **Imagem de compartilhamento** | salve `img/og.jpg` (1200×630). |
| **Ícone no iPhone** | opcional: `img/apple-touch-icon.png` (180×180). |
| **Depoimentos** | procure `DEPOIMENTOS` perto do fim e preencha a lista. **Só depoimentos reais.** Lista vazia = seção escondida. |
| **Texto "Sobre"** | procure `TEXTO SOBRE` — é um rascunho, troque pelas suas frases. |
| **CNPJ** | procure `CNPJ:` no rodapé; preencha ou apague a linha. |
| **Horário de atendimento** | JSON-LD → `openingHoursSpecification` (está seg–sáb 8h–19h, ajuste). |

## Links para os anúncios (message match)

Use a URL final do anúncio com `?tema=` e UTM:

```
https://ocaioadestra.com.br/?tema=guia&utm_campaign=passeio&utm_term=puxar-guia
```

| `tema=` | Título do topo |
|---|---|
| (nenhum) | Adestrador de Cães em Salto/SP: Atendimento na Sua Casa |
| `filhote` | Adestramento de Filhotes em Salto/SP |
| `guia` | Seu Cão Puxa na Guia? Passeio Tranquilo em Poucas Semanas de Treino |
| `agressivo` | Cão Agressivo ou Reativo? Adestrador em Salto/SP |
| `ansiedade` | Cão Destrói a Casa ou Late Sozinho? Tratamento de Ansiedade de Separação |

A mensagem do WhatsApp muda conforme o tema, e se houver `utm_term` (ou, na falta dele,
`utm_campaign`) ela termina com `[origem: puxar-guia]`. Dica: no Google Ads, em
*Modelo de acompanhamento*, use `{lpurl}?utm_term={keyword}&utm_campaign={campaignid}`
— ou só `&tema=...` por grupo de anúncios.

## Como o rastreio funciona

Todo botão com `data-wa` (hero, serviços, CTA, rodapé, botão flutuante) dispara
`gtag('event','conversion',{send_to:'AW-.../RÓTULO'})` no clique e em seguida abre o
WhatsApp em nova aba. O envio usa `transport_type: 'beacon'`, que garante a entrega
mesmo com a troca de aba e não é barrado por bloqueador de pop-up.

Para testar: abra o site com `?gclid=teste`, clique no botão e confira no
Google Tag Assistant (tagassistant.google.com).

## Checklist antes de ligar os anúncios

- [ ] Número, ID e rótulo de conversão trocados
- [ ] Fotos reais no lugar dos placeholders cinza (nada de correção física: cão calmo, tutor sorrindo)
- [ ] `img/og.jpg` enviado
- [ ] HTTPS ativo (certificado SSL grátis na hospedagem) — o `.htaccess` já redireciona http→https
- [ ] Testar no celular e rodar pagespeed.web.dev (meta: LCP < 2,5 s)
