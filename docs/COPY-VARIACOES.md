# Etapa 2: variações de copy por anúncio (`?p=`)

A versão geral (sem `?p=`) está no HTML. As variações abaixo trocam **só** o h1, o
subtítulo, o cartão de dor em destaque (que sobe para o topo da lista) e a mensagem
pronta do WhatsApp. Elas são ligadas por JS na Etapa 3.

| `?p=` | H1 | Subtítulo | Mensagem pronta no WhatsApp (também aparece no balão do chat no desktop) |
|---|---|---|---|
| (geral) | Adestrador de cães em [CIDADE], direto na sua casa | Avalio seu cachorro em casa, monto um plano só para ele e acompanho cada aula. Xixi fora do lugar, cachorro que não fica sozinho, puxão no passeio e agressividade. | Olá, Caio! Vim pelo site e quero agendar uma avaliação para o meu cachorro. |
| `xixi` | Xixi e cocô fora do lugar? Ensino o lugar certo, sem bronca | Treino na sua casa, com um plano para a rotina da família. Para filhotes e para adultos que nunca aprenderam. | Olá, Caio! Vim pelo site. Meu cachorro faz xixi ou cocô fora do lugar e quero agendar uma avaliação. |
| `separacao` | Cachorro que chora quando fica sozinho? Plano individual na sua casa | Avalio o caso na sua casa e monto um plano para ele aprender a ficar sozinho, no ritmo dele. | Olá, Caio! Vim pelo site. Meu cachorro sofre quando fica sozinho e quero agendar uma avaliação. |
| `passeio` | Cachorro puxa a guia ou late para outros cães? Ensino a passear com calma | Aulas no seu passeio, onde o problema acontece, com um plano feito para o seu cachorro. | Olá, Caio! Vim pelo site. Meu cachorro puxa a guia e reage no passeio, e quero agendar uma avaliação. |
| `agressividade` | Cachorro que rosna ou morde? Comece por uma avaliação de risco | Avaliação na sua casa e um plano individual, sem violência, para trazer segurança à família e ao cachorro. | Olá, Caio! Vim pelo site. Meu cachorro rosna ou morde e quero agendar uma avaliação. |

## Rótulos dos botões (no máximo ~26 caracteres, pedido do design)
- Hero e CTA final: **Agendar pelo WhatsApp** (21)
- Passo 1: **Chamar no WhatsApp** (18)

## Marcadores
- `[PREENCHER]`: cidade, bairros/região, valor da avaliação, horário de atendimento e
  um fato verificável sobre o Caio (anos de experiência, nº de cães atendidos ou formação).
- A confirmar com o Caio: a avaliação abate do pacote? Se sim, dizer isso no FAQ de preço.
- `<!-- [CONFIRMAR] -->`: aulas em casa, sem violência, suporte entre aulas e resposta
  rápida, "você sai com o diagnóstico e o plano" (alternativas na tabela da
  ESTRATEGIA.md).
- Depoimentos: só reais. Sem eles, a seção sai inteira.
