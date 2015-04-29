class Amostra

  constructor: (@id, @exame, @lote) ->
    @criadoEm = new Date
    @status = 'aguardando'
    console.log('nova amostra '+@id+' exame '+@exame.codigo)
    @resultadoProntoList = []

  inventarResultado: () =>
    @resultadoEm = new Date
    @resultado = Math.round(Math.random() * (@exame.maximoPossivel-@exame.minimoPossivel) + @exame.minimoPossivel)
    @normal = @exame.resultadoNormal(@resultado)
    this.fireResultadoPronto()

  addResultadoPronto: (f) =>
    @resultadoProntoList.push(f)

  fireResultadoPronto: () =>
    @status = 'pronto'
    console.log('resultado pronto amostra '+@id+' exame '+@exame.codigo+' valor '+@resultado)
    f this for f in @resultadoProntoList

  iniciarProcessamento: () =>
    @status = 'processo'
    console.log('amostra em processo '+@id)
    setTimeout(this.inventarResultado, Math.random() * 90000)

root.Amostra = Amostra
