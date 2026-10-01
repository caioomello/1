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
   microconfiança ("Fale direto comigo, sem compromisso", com a foto do Caio ao lado).
2. **Faixa de confiança (logo abaixo do hero):** 3 itens curtos e verdadeiros
   (fato verificável sobre o Caio, ou "Plano individual" se não houver · aulas na sua casa
   · método sem violência). Responde "é
   confiável?" ainda na primeira tela do celular.
3. **Problemas que resolvo:** cartões com as dores. O cartão de agressividade/mordida
   leva a frase de segurança: "Avaliamos o risco antes de começar, com segurança para a
   família e para o cão." A dor vinda do `?p=` aparece em destaque.
4. **Como funciona (3 passos):** (1) chame no WhatsApp, e **esse passo é um botão**,
   o ponto de maior intenção; (2) avaliação individual e paga na sua casa;
   (3) plano de aulas, com suporte pelo WhatsApp entre as aulas.
5. **Prazer, eu sou o Caio (#confianca):** foto e nome completo do Caio, credencial
   real, 3 compromissos de processo (conversa antes de pagar, preço conhecido antes,
   tutor presente nas aulas) e **depoimentos reais** com bairro e origem, sem estrelas
   autoatribuídas. **Fallback:** sem depoimentos reais, o bloco de depoimentos sai.
   Nenhum depoimento é inventado.
6. **FAQ (4 perguntas):** Quanto custa? (com o deslocamento) · Meu cachorro é adulto,
   ainda dá jeito? · Em quanto tempo vejo resultado? · Meu cachorro já mordeu alguém.
   Você atende? (O formato das aulas foi para o passo 3.)
   A resposta sobre tempo **não promete prazo**: diz que depende do caso, que a
   avaliação define o plano e o ritmo.
7. **CTA final** (com o horário de atendimento logo abaixo do botão): repete a oferta. A versão padrão é neutra ("Me chame agora e receba os
   horários disponíveis desta semana"). A urgência "agenda limitada" só entra se o Caio
   confirmar que é verdade.
8. **Rodapé:** nome completo · região · WhatsApp em texto · e-mail · CNPJ/MEI (se
   houver) · política de privacidade recolhida (cookies do Google Ads, LGPD).

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
| É o próprio Caio quem responde o WhatsApp ("Fale direto comigo") | "Converse com a equipe do Caio, sem compromisso" e, nos compromissos, "Você conversa com a gente antes de pagar qualquer coisa" |
| Na avaliação o tutor sai com diagnóstico e plano | "Na avaliação, entendo a causa e explico os próximos passos" |
| Deslocamento incluso na região atendida | "Taxa de deslocamento informada na conversa" |

**Regra de publicação:** se sobrar `[CONFIRMAR]`, `[PREENCHER]`, `5500000000000` ou
`AW-XXXX` no código, a página não vai ao ar (verificação da etapa 8).

## Métricas
- **Principal:** clique em qualquer botão de WhatsApp, registrado como conversão no
  Google Ads (gtag), com dois parâmetros no evento: `posicao` (hero, meio, passos,
  fixo, final) e `problema` (valor do `?p=`). Serve para saber qual botão e qual variação
  convertem. O evento dispara **antes** de abrir o WhatsApp (`transport_type: 'beacon'`),
  e o gtag é carregado com `async`, sem bloquear a renderização.
- **Configuração no Google Ads:** criar a ação de conversão "Clique no WhatsApp" com
  **Contagem = Uma** (um lead por clique de anúncio, mesmo que a pessoa clique em vários
  botões). Para ver o resultado por botão e por variação, criar as **variáveis
  personalizadas de conversão** `posicao` e `problema`, ou preencher o `gaId` (GA4) no
  CONFIG da página.
- **Secundária (fora da página):** clique não é lead. O lead real é a conversa iniciada,
  e o resultado é o status "Fechado" na Ficha de Leads com origem "Google Ads".
