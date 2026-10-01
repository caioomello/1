# Etapa 0: estratégia e estrutura (v3, aprovada 9/10)

## Quem chega na página
Tutor que acabou de buscar no Google algo como "adestrador de cães [cidade]", "cachorro
fazendo xixi no lugar errado", "cachorro chora quando fico sozinho" ou "cachorro
agressivo". Está frustrado, às vezes envergonhado (vizinho reclamando, visita mordida), e
quer saber em segundos: **resolve meu problema? é confiável? atende onde eu moro? como
começo?**

## Promessa central
Um plano feito para o seu cachorro, com aulas na sua casa e acompanhamento do começo ao
fim. A página promete **método e acompanhamento**, não "resultado garantido". Isso vale
especialmente para agressividade, por compliance do Google Ads e para alinhar
expectativas.

## Oferta (ação única da página)
**Agendar a avaliação comportamental pelo WhatsApp.** Não há formulário. O botão abre o
WhatsApp com uma mensagem pronta (que muda conforme o problema), então o lead só precisa
tocar em "enviar". Não há menu nem redes sociais, porque cada saída é um lead perdido.

**Preço:** a avaliação é paga e isso fica explícito. O valor ("a partir de R$ 159",
editável em `[PREENCHER]`) aparece **no FAQ**, e "Como funciona" diz que a avaliação é
individual e paga. Assim, quem não aceita pagar se filtra sozinho antes de ocupar o
WhatsApp, sem pôr o preço em destaque no hero.

## Relevância com o anúncio (Índice de Qualidade)
Uma página, várias variações. O parâmetro de URL `?p=` troca a headline, o subtítulo, a
dor em destaque e a mensagem pronta do WhatsApp, com poucas linhas de JS e sem atraso
visual (o texto padrão já vem no HTML):
- `?p=xixi` (filhote, xixi/cocô fora do lugar)
- `?p=separacao` (ansiedade de separação: chora, late, destrói quando fica sozinho)
- `?p=passeio` (puxa a guia, late e avança em outros cães)
- `?p=agressividade` (rosna, morde, agressivo com pessoas ou cães)
- sem parâmetro: headline geral com o termo principal "Adestrador de cães em [CIDADE]"

Regras: valor vazio ou desconhecido cai na versão geral; mordida fica em
`?p=agressividade`. A variação muda **só** headline, subtítulo, dor em destaque e
mensagem do WhatsApp, nunca preço, promessa ou seções.

Cada grupo de anúncios do Google Ads aponta para a sua variação.

## Ordem das seções
1. **Hero:** headline (eco da busca), subtítulo com o "como" e a **região atendida**
   `[PREENCHER cidade/bairros]`, botão de WhatsApp e, logo abaixo, uma linha de
   microconfiança ("Resposta rápida no WhatsApp · Sem compromisso para conversar").
2. **Faixa de confiança (logo abaixo do hero):** 3 itens curtos e verdadeiros
   (atendimento em casa · plano individual · método sem violência). Responde "é
   confiável?" ainda na primeira tela do celular.
3. **Problemas que resolvo:** cartões com as dores. O cartão de agressividade/mordida
   leva a frase de segurança: "Avaliamos o risco antes de começar, com segurança para a
   família e para o cão." A dor vinda do `?p=` aparece em destaque.
4. **Como funciona (3 passos):** (1) chame no WhatsApp, e **esse passo é um botão**,
   o ponto de maior intenção; (2) avaliação individual e paga na sua casa;
   (3) plano de aulas, com suporte pelo WhatsApp entre as aulas.
5. **Quem já passou por aqui:** só o que a faixa de confiança não cobre, ou seja,
   **depoimentos reais** (e credencial/formação, se houver). Os diferenciais **não** se
   repetem aqui. **Fallback:** sem depoimentos reais nem credencial verificável, a seção
   inteira sai da página. Nenhum depoimento é inventado.
6. **FAQ (4 perguntas):** Quanto custa? · Meu cachorro é adulto, ainda dá jeito? · Em
   quanto tempo vejo resultado? · Como são as aulas?
   A resposta sobre tempo **não promete prazo**: diz que depende do caso, que a
   avaliação define o plano e o ritmo.
7. **CTA final:** repete a oferta. A versão padrão é neutra ("Me chame agora e receba os
   horários disponíveis desta semana"). A urgência "agenda limitada" só entra se o Caio
   confirmar que é verdade.
8. **Rodapé de uma linha:** nome · região · horário de atendimento no WhatsApp.

## Botão fixo de WhatsApp (mobile)
- Aparece quando o botão do hero sai da tela (IntersectionObserver).
- Some quando o CTA final está visível, para não duplicar.
- O `body` recebe padding inferior para o botão nunca cobrir o conteúdo.
- No desktop, vira um botão flutuante discreto no canto.

## Afirmações a confirmar com o Caio (marcadas no código com `[CONFIRMAR]`)
| Afirmação | Se for falsa, usar |
|---|---|
| Aulas e avaliação na casa do cliente | "Aulas presenciais em [local]" e trocar "na sua casa" por "presencial" |
| Método sem violência / reforço positivo | Remover o item da faixa; manter "plano individual" |
| Suporte pelo WhatsApp entre as aulas | Remover do passo 3 |
| "Resposta rápida no WhatsApp" | "Respondo no mesmo dia" ou remover; o horário no rodapé cobre a expectativa |

**Regra de publicação:** se sobrar `[CONFIRMAR]` ou `[PREENCHER]` no código, a página
não vai ao ar (verificação da etapa 8).

## Métricas
- **Principal:** clique em qualquer botão de WhatsApp, registrado como conversão no
  Google Ads (gtag), com dois parâmetros no evento: `posicao` (hero, passos, fixo,
  final) e `problema` (valor do `?p=`). Serve para saber qual botão e qual variação
  convertem. O evento dispara **antes** de abrir o WhatsApp (`transport_type: 'beacon'`),
  e o gtag é carregado com `async` depois do conteúdo, sem bloquear a renderização.
- **Secundária (fora da página):** clique não é lead. O lead real é a conversa iniciada,
  e o resultado é o status "Fechado" na Ficha de Leads com origem "Google Ads".
