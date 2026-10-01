# Checklist para publicar a landing page

O script `site/publicar.sh` **se recusa a gerar a versão final** enquanto sobrar
`[PREENCHER]`, `[CONFIRMAR]`, o número `5500000000000`, `AW-XXXX` ou o rótulo `XXXX…` no
código. Siga a lista abaixo e rode o script no final.

## 1. Dados para enviar (ou preencher em `site/index.html`)
| O quê | Onde aparece |
|---|---|
| **Número do WhatsApp** (55 + DDD + número) | Localize e substitua `5500000000000` em todo o arquivo. Coloque também no rodapé em formato legível e no JSON-LD (`telephone`). |
| **Cidade, UF e bairros/região atendidos** | Título, descrição, h1, selo "Atendo em", FAQ (deslocamento), rodapé e JSON-LD |
| **Sobrenome do Caio** | Seção "Prazer, eu sou o Caio", rodapé, privacidade e JSON-LD |
| **Foto do Caio** (quadrada, rosto visível, de preferência com um cachorro). Salve como `site/caio.webp` com 224x224 e até ~20 KB | Seção "Prazer" e nota do hero (os dois trechos já estão prontos em comentário) |
| **1 fato verificável** (anos de experiência, formação ou nota no Google) | 1º item da faixa de confiança. Se não houver, use "Plano individual para o seu cachorro". |
| **Bio curta** (1 ou 2 frases reais) | Seção "Prazer" |
| **Valor da avaliação** | FAQ "Quanto custa?" e JSON-LD (`priceRange`) |
| **Horário de atendimento no WhatsApp** | Abaixo do CTA final e no JSON-LD |
| **E-mail** e **CNPJ/MEI** (se tiver) | Rodapé e privacidade |
| **Depoimentos reais** (com autorização) | Seção "Prazer": nome + inicial, nome do cachorro, bairro, caso e origem. **Sem depoimentos, apague o bloco `.quotes`.** |
| **Nota no Google / links do Perfil da Empresa e do Instagram** (se tiver) | Linha abaixo dos depoimentos e JSON-LD (`sameAs`). Se não tiver, apague. |
| **Domínio** (ex.: caioadestra.com.br) | canonical, og:url, og:image, JSON-LD, robots.txt e sitemap.xml |
| **ID e rótulo de conversão do Google Ads** | Bloco `CONFIG` no fim do arquivo |

## 2. Afirmações para confirmar (apague o comentário `[CONFIRMAR]` depois)
Se alguma for falsa, use a alternativa da tabela em `docs/ESTRATEGIA.md`.
- As aulas e a avaliação são **na casa do cliente**?
- O método é **sem violência**?
- Há **suporte pelo WhatsApp entre as aulas**?
- É o **próprio Caio** quem responde o WhatsApp?
- O **deslocamento está incluso** na região atendida?
- O tutor **sai da avaliação com o diagnóstico e o plano**?
- Existe formação que justifique "especialista em comportamento canino"?
- A avaliação **abate do pacote**? Se sim, vale dizer isso no FAQ de preço, porque é o melhor argumento contra a objeção de preço.

## 3. Google Ads
1. Crie a ação de conversão **"Clique no WhatsApp"** (Site → manual), com **Contagem = Uma**.
2. Copie o ID (`AW-…`) e o rótulo para o `CONFIG`.
3. Crie as variáveis personalizadas de conversão `posicao` e `problema`, ou preencha o
   `gaId` do GA4, para saber qual botão e qual anúncio convertem.
4. Aponte cada grupo de anúncios para a variação certa:
   - `https://seudominio/?p=xixi`
   - `?p=separacao`
   - `?p=passeio`
   - `?p=agressividade`
   - sem parâmetro para o grupo genérico ("adestrador de cães")

## 4. Publicar
```bash
cd site && ./publicar.sh      # gera site/dist/
```
Suba a pasta `dist/` no **Cloudflare Pages** (grátis, rápido no Brasil e lê o `_headers`).
Ative "Always Use HTTPS" e deixe **desligados** o Rocket Loader, o Zaraz e o Web Analytics.

## 5. Validar depois de publicar
- [ ] PageSpeed Insights no celular ≥ 90 (com o gtag real).
- [ ] Tag Assistant: a conversão dispara nos 5 botões (hero, meio, passos, final, fixo).
- [ ] O Google Ads mostra a conversão como "Registrando conversões" em 24–48 h.
- [ ] Abrir cada `?p=` no celular e conferir o título e a mensagem pronta do WhatsApp.
- [ ] Mandar o link num chat do WhatsApp e conferir a prévia (imagem `og.jpg`).
- [ ] Com a cidade preenchida, confirmar que o botão do hero aparece sem rolar num iPhone SE.
