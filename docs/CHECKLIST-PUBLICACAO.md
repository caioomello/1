# Checklist para colocar a página no ar

São duas partes: **A** é para o Caio responder (sem nada técnico) e **B** é para quem vai
publicar.

---

## Parte A: perguntas para o Caio

Responda e envie para quem vai publicar. Tudo o que você escrever aparece na página,
então **só coloque informação verdadeira**.

### Dados do negócio
1. Número do WhatsApp de atendimento (com DDD): ______________________
2. Cidade e estado: ______________________
3. Bairros ou região que você atende: ______________________
4. Seu sobrenome (aparece em "Prazer, eu sou o Caio" e no rodapé): ______________________
5. Valor da avaliação (R$): ______________________
6. Horário em que você responde o WhatsApp (ex.: seg a sáb, 8h às 19h): ______________________
7. E-mail de contato: ______________________
8. CNPJ ou MEI (se tiver): ______________________
9. Endereço do site que você vai comprar (ex.: caioadestra.com.br): ______________________

### Sobre você
10. Escreva 1 ou 2 frases sobre você: formação, há quanto tempo trabalha com cães, quantos
    cães já atendeu e por que trabalha sem violência.
    ______________________________________________________________
11. Um fato curto e verdadeiro para o topo da página (ex.: "6 anos de experiência",
    "Formado em comportamento canino pela X", "Nota 4,9 no Google"). Se não tiver,
    deixe em branco. ______________________
12. **Foto sua (obrigatória: sem foto, a página não vai ao ar).** Como fazer:
    - de dia, com luz natural, rosto bem visível e sorrindo;
    - de preferência com um cachorro (pode ser o seu ou de um cliente, com autorização);
    - foto na vertical ou quadrada, sem filtro, com fundo simples;
    - mande o arquivo original pelo WhatsApp **como documento**, para não perder qualidade.

### Depoimentos (opcional, mas ajuda muito)
13. Até 2 depoimentos **reais** de clientes, com autorização deles por escrito (guarde
    o print). Para cada um, informe:
    - primeiro nome e inicial do sobrenome;
    - nome do cachorro;
    - bairro;
    - qual era o problema;
    - o texto;
    - onde a pessoa escreveu (Google ou WhatsApp).
    Evite depoimentos com prazo ("resolveu em 1 semana"). Sem depoimentos, a seção é
    retirada da página.
14. Você tem perfil no Google (Perfil da Empresa) com avaliações? Se sim, informe a nota,
    o número de avaliações e o link. E o seu Instagram? ______________________

### Confirme (responda sim ou não)
| Pergunta | Sim/Não |
|---|---|
| As aulas e a avaliação são feitas na casa do cliente? | |
| O seu método é sem violência (sem enforcador, choque ou punição)? | |
| O cliente tem suporte pelo WhatsApp entre as aulas? | |
| É você mesmo quem responde o WhatsApp? | |
| O deslocamento está incluso na região que você atende? | |
| Na avaliação, o cliente sai com o diagnóstico e o plano de aulas? | |
| Você tem formação ou curso em comportamento canino? (qual?) | |
| O valor da avaliação é descontado se o cliente fechar o pacote? | |

Se alguma resposta for "não", o texto da página muda para uma versão verdadeira (as
alternativas estão em `docs/ESTRATEGIA.md`).

---

## Parte B: para quem vai publicar

### B1. Pré-requisitos
- Comprar o domínio no registro.br (ou outro registrador).
- Criar uma conta grátis no **Cloudflare Pages** e apontar o domínio para ela.
- Ter **Node.js 18+** e **bash** na máquina (o script usa `npx`).
- Ter acesso à conta do **Google Ads** do Caio.

### B2. Preencher `site/index.html`
O script `site/publicar.sh` **se recusa a publicar** enquanto sobrar `[PREENCHER]`,
`[CONFIRMAR]`, o número `5500000000000`, `AW-XXXX`, o rótulo `XXXX…`, a foto ou
dados estruturados inválidos.

| Dado (resposta da Parte A) | Onde trocar |
|---|---|
| WhatsApp (A1) | Localize e substitua `5500000000000` em todo o arquivo (formato 55DDDNÚMERO). Coloque também no rodapé, em formato legível, e no `telephone` do JSON-LD. |
| Cidade, UF, bairros (A2, A3) | `<title>`, description, og:title, h1, selo "Atendo em", FAQ de preço, rodapé e JSON-LD |
| Sobrenome (A4) | Seção #confianca, rodapé, privacidade e JSON-LD (`founder`) |
| Valor (A5) | FAQ "Quanto custa?" e `priceRange` do JSON-LD |
| Horário (A6) | Nota abaixo do CTA final e `openingHoursSpecification` |
| E-mail, CNPJ (A7, A8) | Rodapé e privacidade. Sem CNPJ, apague o trecho. |
| Domínio (A9) | canonical, og:url, og:image, JSON-LD, `robots.txt` e `sitemap.xml` |
| Bio e fato (A10, A11) | Seção #confianca e 1º item da faixa de confiança. Sem fato, use "Plano individual para o seu cachorro". |
| Foto (A12) | Recorte quadrado de 224x224, salve como `site/caio.webp` (até ~20 KB). Ative os 2 trechos que já estão prontos em comentário: o `.avatar` e a nota do hero. |
| Depoimentos (A13) | Bloco `.quotes`. Sem depoimentos, apague o bloco inteiro. |
| Google e Instagram (A14) | Linha `.rating` e `sameAs` do JSON-LD. Sem eles, apague (cuidado com a vírgula no JSON). |
| Confirmações | Para cada "sim", apague o comentário `[CONFIRMAR]`; para cada "não", use a alternativa de `docs/ESTRATEGIA.md`. Inclua também o `[CONFIRMAR]` da política de privacidade: se o `gaId` (GA4) for preenchido, o texto passa a citar o Google Analytics. Se a avaliação for descontada do pacote, acrescente isso no FAQ de preço. |

### B3. Google Ads
1. Crie a ação de conversão **"Clique no WhatsApp"** (Site → manual), com **Contagem = Uma**.
2. Copie o ID (`AW-…`) e o rótulo para o bloco `CONFIG`, no fim do `index.html`.
3. Crie as variáveis personalizadas de conversão `posicao` e `problema`, ou preencha o
   `gaId` do GA4, para saber qual botão e qual anúncio convertem.
4. Aponte cada grupo de anúncios para a variação certa:
   - `https://dominio/?p=xixi`
   - `?p=separacao`
   - `?p=passeio`
   - `?p=agressividade`
   - sem parâmetro para o grupo genérico ("adestrador de cães")

### B4. Gerar e subir
```bash
cd site && ./publicar.sh      # gera site/dist/
```
Suba a pasta `dist/` no Cloudflare Pages. Ative "Always Use HTTPS" e deixe **desligados**
o Rocket Loader, o Zaraz e o Web Analytics.

### B5. Validar depois de publicar
- [ ] PageSpeed Insights no celular ≥ 90 (com o gtag real).
- [ ] Tag Assistant: a conversão dispara nos 5 botões: hero, passos e final (em qualquer
      tela), "meio" (só no computador, logo abaixo dos cartões de problema) e "fixo" (aparece
      depois de rolar além do primeiro botão).
- [ ] O Google Ads mostra a conversão como "Registrando conversões" em 24–48 h.
- [ ] Abrir cada `?p=` no celular e conferir o título e a mensagem pronta do WhatsApp.
- [ ] Mandar o link num chat do WhatsApp e conferir a prévia (`og.jpg`).
- [ ] Com a cidade preenchida, confirmar que o botão do hero aparece sem rolar num iPhone SE.
