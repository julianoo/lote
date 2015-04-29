class Amostra

  constructor: (@id, @exame, @lote) ->
    @criadoEm = new Date
    @status = 'aguardando'
    console.log('nova amostra '+@id+' exame '+@exame.codigo)

  @resultado
  @resultadoEm
  @normal

  resultadoProntoList = []

  addResultadoPronto: (f) ->
    resultadoProntoList.push(f)

  fireResultadoPronto: =>
    @status = 'pronto'
    console.log('resultado pronto amostra '+@id)
    f() for f in resultadoProntoList

  iniciarProcessamento: ->
    @status = 'processo'
    console.log('amostra em processo '+@id)
    #timer


root.Amostra = Amostra
