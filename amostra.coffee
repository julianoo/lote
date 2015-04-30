class Amostra

  constructor: (@id, @exame, @lote) ->
    @criadoEm = new Date
    @status = 'aguardando'
    console.log('nova amostra '+@id+' exame '+@exame.codigo)
    @resultadoProntoList = []

  retornaHtml: () =>
    tipo = ''
    resultado = ''
    if @status == 'aguardando'
      tipo = 'alert-info'
    else if @status == 'processo'
      tipo = 'alert-warning'
    else if @status == 'pronto'
      if @normal
        tipo = 'alert-success'
      else if !@normal
        tipo = 'alert-danger'

      if @exame.tipo == 'numero'
        resultado = @resultado
      else if @resultado
        resultado = 'Positivo'
      else
        resultado = 'Negativo'

    return '<div class="'+tipo+'" role="alert" id="amostra'+@id+'">#'+
      @id+' '+@exame.codigo.toUpperCase()+': '+resultado
    +'</div>'

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
    setTimeout(this.inventarResultado, Math.random() * 30000)

root.Amostra = Amostra
