class TipoExame
  @codigo
  @nome
  @tipo
  @minimoPossivel
  @maximoPossivel
  @minimoNormal
  @maximoNormal

  resultadoNormal: (resultado) ->
    return resultado >= @minimoNormal && resultado <= @maximoNormal

root.TipoExame = TipoExame
