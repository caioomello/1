# Contexto do usuário

**Proprietário:** Caio
**Negócio:** Caio Adestra — adestramento e comportamento canino

## Como o negócio funciona

- Atendimento e vendas via WhatsApp: leads chegam, é feita uma avaliação
  (geralmente paga, ~R$159–169) e depois pacotes de aulas recorrentes
  (avulsa, 4 aulas, 1x/sem ou 2x/sem).
- Muitos leads vêm de indicação pessoal ou GetNinjas.
- Casos comuns: filhotes com xixi/cocô fora do lugar, ansiedade de
  separação, mordida, reatividade em passeios, agressividade.

## Pipeline de leads

- Leads são acompanhados em uma ficha/planilha com status:
  **Fechado**, **Em aberto**, **Perdido**, **Indefinido**, **Erro**
  (erro = conversa não pôde ser processada, ex.: zip acima do limite
  de tamanho ou falha de download do Drive).
- Fonte dos dados: exports de conversas do WhatsApp (zips) salvos no
  Google Drive, pasta "Leads whatsapp".
- Um exemplo desse levantamento foi publicado como Artifact
  ("Ficha de Leads") na sessão de nome "OPA".

## Painel do negócio

- Artifact "Painel Caio Adestra": https://claude.ai/artifact/BPwwe2A3dn2FzptCkdtEJi
  (código em `dashboard/painel.html`).
- Dados no banco do próprio artifact (só dono/editores leem): coleções
  `clientes`, `pagamentos` (status pago/pendente/previsto), `despesas`,
  `anuncios` (doc id = `AAAA-MM`), e docs `config/geral` (metaMensal) e
  `config/funil` (contagens da Ficha de Leads + follow-ups).
- Agenda vem ao vivo do Google Agenda (eventos criados pelo Caio que começam
  com "Aula" ou "Avaliação"). Campo `conferir: true` = dado deduzido.

## Preferências

- Comunicação em **português do Brasil (pt-BR)**.

## Notas técnicas — Claude Code Remote (mensagens entre sessões)

- **`ListAgents`/`SendMessage` só funcionam entre sessões na MESMA máquina/container.**
  Sessões criadas via `create_session` (Claude Code Remote) rodam em containers
  remotos separados e NÃO aparecem no `ListAgents` umas das outras — uma tentativa
  de `SendMessage` entre elas falha com "No agent named ... is reachable".
- **Para mandar mensagem de uma sessão remota pra outra**, use:
  `create_trigger` com `persistent_session_id="<session_id da sessão alvo>"`,
  seguido de `fire_trigger` no trigger criado para entregar na hora
  (sem `cron_expression`/`run_once_at` = dispara só quando chamado). Isso funciona
  em ambas as direções — a sessão remota também pode usar o mesmo mecanismo pra
  responder de volta (`persistent_session_id` = id da sessão que perguntou).
- **Padrão executor/supervisor com sessões separadas**: uma sessão gera/atualiza um
  artifact (ex.: a Ficha de Leads), manda resumo pra sessão supervisora pelo
  mecanismo acima, a supervisora avalia (nota 0–100) e devolve aprovação ou
  correções pelo mesmo caminho — repete até aprovar ou até um limite de rodadas.
- Ao criar esse tipo de trigger via API/MCP, o parâmetro `connectors` do
  `create_trigger` **não está disponível** para esta organização — se a sessão
  disparada precisa de Google Drive/Mem0/etc., prefira disparar em uma sessão que
  já os tenha carregados (self-bind) em vez de depender desse parâmetro.
