class Lote
  constructor: (@id) ->
    @status = 'aberto'
    console.log('novo lote '+@id)
    setTimeout(this.fireInicioProcesso, 30000)
    @amostras = []
    @inicioProcessoList = []
    @fimProcessoList = []
    @amostraAdicionadaList = []

  retornaHtml: () =>
    return '<div class="panel panel-default" id="panel'+@id+'">
      <div class="panel-heading">
        <h3 class="panel-title">Lote '+@id+'</h3>
      </div>
      <div class="panel-body" id="lote'+@id+'"></div>
    </div>'

  verificarLotePronto: (a) =>
    $('#amostra'+a.id).replaceWith(a.retornaHtml())
    processando = false
    for am in @amostras
      if am.status == 'processo'
        processando = true
    if !processando
      this.fireFimProcesso()

  addAmostra: (a) =>
    a.addResultadoPronto(this.verificarLotePronto)
    @amostras.push(a)
    this.fireAmostraAdicionada(a)

  addInicioProcesso: (f) =>
    @inicioProcessoList.push(f)
    return this

  fireInicioProcesso: =>
    @status = 'processo'
    console.log('lote em processo '+@id)
    a.iniciarProcessamento() for a in @amostras
    f this for f in @inicioProcessoList

  addFimProcesso: (f) =>
    @fimProcessoList.push(f)
    return this

  fireFimProcesso: =>
    @status = 'pronto'
    console.log('lote pronto '+@id)
    f this for f in @fimProcessoList

  addAmostraAdicionada: (f) =>
    @amostraAdicionadaList.push(f)
    return this

  fireAmostraAdicionada: (a) =>
    console.log('amostra no lote '+a.id)
    f this, a for f in @amostraAdicionadaList


root.Lote = Lote
