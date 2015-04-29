glic = new TipoExame()
glic.codigo = 'glic'
glic.nome = 'glicose'
glic.tipo = 'numero'
glic.minimoPossivel = 100
glic.maximoPossivel = 300
glic.minimoNormal = 150
glic.maximoNormal = 250

hiv = new TipoExame
hiv.codigo = 'hiv'
hiv.nome = 'hiv'
hiv.tipo = 'boolean'
hiv.minimoPossivel = 0
hiv.maximoPossivel = 1
hiv.minimoNormal = 0
hiv.maximoNormal = 0

crea = new TipoExame
crea.codigo = 'crea'
crea.nome = 'creatinina'
crea.tipo = 'numero'
crea.minimoPossivel = 20
crea.maximoPossivel = 50
crea.minimoNormal = 30
crea.maximoNormal = 40

trig = new TipoExame
trig.codigo = 'trig'
trig.nome = 'triglicerideos'
trig.tipo = 'numero'
trig.minimoPossivel = 200
trig.maximoPossivel = 500
trig.minimoNormal = 300
trig.maximoNormal = 400

exames = [glic, hiv, crea, trig]
running = false
lotesProcessando = []
lotesProntos = []
idAmostra = 0
idLote = 0
loteAberto = null

inicioProcessamentoLote = (lote) ->
  loteAberto = null

fimProcessamentoLote = (lote) ->

amostraAdicionadaLote = (lote, am) ->


gerarAmostra = () ->
  if running
    if loteAberto == null
      idLote = idLote + 1
      loteAberto = new Lote(idLote)
      loteAberto.addInicioProcesso(inicioProcessamentoLote)
      loteAberto.addFimProcesso(fimProcessamentoLote)
      loteAberto.addAmostraAdicionada(amostraAdicionadaLote)

    idAmostra = idAmostra + 1
    am = new Amostra(idAmostra, exames[Math.floor(Math.random()*4)], loteAberto)
    loteAberto.addAmostra(am)

    setTimeout(gerarAmostra, Math.random()*6000)

root.iniciarProcesso = () ->
  running = true
  gerarAmostra()

root.pararProcesso = () ->
  running = false
