glic = new TipoExame()
glic.codigo = 'glic'
glic.nome = 'glicose'
glic.tipo = 'numero'
glic.minimo_possivel = 100
glic.maximo_possivel = 300
glic.minimo_normal = 150
glic.maximo_normal = 250

hiv = new TipoExame
hiv.codigo = 'hiv'
hiv.nome = 'hiv'
hiv.tipo = 'boolean'
hiv.minimo_possivel = 0
hiv.maximo_possivel = 1
hiv.minimo_normal = 0
hiv.maximo_normal = 1

crea = new TipoExame
crea.codigo = 'crea'
crea.nome = 'creatinina'
crea.tipo = 'numero'
crea.minimo_possivel = 20
crea.maximo_possivel = 50
crea.minimo_normal = 30
crea.maximo_normal = 40

trig = new TipoExame
trig.codigo = 'trig'
trig.nome = 'triglicerideos'
trig.tipo = 'numero'
trig.minimo_possivel = 200
trig.maximo_possivel = 500
trig.minimo_normal = 300
trig.maximo_normal = 400

exames = [glic, hiv, crea, trig]
gerar_amostra = false

gerar_amostra = () ->
  gerar_amostra = true

parar_geracao = () ->
  gerar_amostra = false
