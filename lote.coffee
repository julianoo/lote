class Lote
  constructor: (@id) ->
    @status = 'aberto'
    console.log('novo lote '+@id)
    setTimeout(this.fireInicioProcesso, 30000)

  amostras = []

  inicioProcessoList = []
  fimProcessoList = []
  amostraAdicionadaList = []

  addAmostra: (a) =>
    amostras.push(a)
    this.fireAmostraAdicionada(a)

  addInicioProcesso: (f) =>
    inicioProcessoList.push(f)
    return this

  fireInicioProcesso: =>
    @status = 'processo'
    console.log('lote em processo '+@id)
    f this for f in inicioProcessoList

  addFimProcesso: (f) =>
    fimProcessoList.push(f)
    return this

  fireFimProcesso: =>
    @status = 'pronto'
    console.log('lote pronto'+@id)
    f this for f in fimProcessoList

  addAmostraAdicionada: (f) =>
    amostraAdicionadaList.push(f)
    return this

  fireAmostraAdicionada: (a) =>
    console.log('amostra no lote '+a.id)
    f this, a for f in amostraAdicionadaList


root.Lote = Lote
