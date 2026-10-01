# Landing page Caio Adestra: plano de construção

**Objetivo:** página única que recebe o clique do Google Ads e converte o visitante em
conversa no WhatsApp (pedido de avaliação).

**Regras do processo**
- Cada etapa tem um **construtor** (Claude, sessão principal) e um **revisor** (agente
  independente). O revisor dá nota de 0 a 10.
- Uma etapa só é concluída com **nota ≥ 9/10**. Abaixo disso, o construtor corrige e o
  mesmo revisor reavalia.
- Uma etapa por vez, na ordem abaixo.

**Restrições técnicas (todas as etapas)**
- Um único arquivo `site/index.html` com CSS e JS embutidos, sem framework, sem fonte
  externa, sem imagem pesada (ícones em SVG inline).
- Meta: menos de 30 KB transferidos (gzip) e conteúdo visível no primeiro pacote de rede.
- Mobile first, porque a maior parte do tráfego do Google Ads vem do celular.

| # | Etapa | O que é construído | O que o revisor avalia |
|---|-------|--------------------|------------------------|
| 0 | Estratégia e estrutura | Público, promessa, oferta, CTA único, ordem das seções | Clareza da oferta, foco em conversão, se cada seção tem razão de existir |
| 1 | Design (visual) | Paleta azul, tipografia, espaçamentos, grid, componentes base, esqueleto HTML | Visual clean, confiança, hierarquia, contraste, consistência |
| 2 | Copy | Todos os textos: headline, dores, solução, como funciona, oferta, FAQ, CTA final | Persuasão, concisão, tom, clareza, objeções respondidas |
| 3 | Botões e CTAs | Botões de WhatsApp com mensagem pronta, CTA fixo no mobile, rastreio de conversão do Google Ads | Visibilidade, frequência, área de toque, texto do botão, rastreamento |
| 4 | Transições | Animação de entrada entre seções (CSS + IntersectionObserver), respeitando "reduzir movimento" | Suavidade, sutileza, custo de desempenho, sem atrapalhar a leitura |
| 5 | Elementos de confiança | Garantias, prova social, credenciais, ícones | Credibilidade, honestidade (sem dado inventado), posicionamento |
| 6 | Performance e SEO | Peso, ordem de carregamento, meta tags, Open Graph, dados estruturados (LocalBusiness) | Velocidade, boas práticas, Índice de Qualidade do Google Ads |
| 7 | Responsividade e acessibilidade | Teste em 390 px e 1366 px, foco de teclado, contraste, semântica | Funciona em qualquer tela e para qualquer pessoa |
| 8 | Revisão final integrada | Página completa | Nota geral de conversão, confiança e velocidade |

**Dados que o Caio precisa preencher antes de publicar** (ficam marcados no código como
`[PREENCHER]`): número do WhatsApp, cidade/região atendida, depoimentos reais, foto
(opcional), ID de conversão do Google Ads.
