# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
cleanUpSpecialChars = (str) ->
  str = str.replace(/[ÀÁÂÃÄ]/g, "A")
  str = str.replace(/[àáâãä]/g, "a")
  str = str.replace(/[ÈÉÊẼË]/g, "E")
  str = str.replace(/[èéêẽë]/g, "e")
  str = str.replace(/[ÌÍÎĨÏ]/g, "I")
  str = str.replace(/[ìíîĩï]/g, "i")
  str = str.replace(/[ÒÓÔÕÖ]/g, "O")
  str = str.replace(/[òóôõö]/g, "o")
  str = str.replace(/[ÙÚÛŨÜ]/g, "U")
  str = str.replace(/[ùúûũü]/g, "u")

# https://www.todoespacoonline.com/w/2014/11/como-validar-cpf-e-cnpj-com-javascript-ou-jquery/
calc_digitos_posicoes = (digitos, posicoes = 10, soma_digitos = 0) ->
  # Garante que o valor é uma string
  digitos = digitos.toString()
  # Faz a soma dos dígitos com a posição
  # Ex. para 10 posições:
  #   0    2    5    4    6    2    8    8   4
  # x10   x9   x8   x7   x6   x5   x4   x3  x2
  #   0 + 18 + 40 + 28 + 36 + 10 + 32 + 24 + 8 = 196
  i = 0
  while i < digitos.length
    # Preenche a soma com o dígito vezes a posição
    soma_digitos = soma_digitos + digitos[i] * posicoes
    # Subtrai 1 da posição
    posicoes--
    # Parte específica para CNPJ
    # Ex.: 5-4-3-2-9-8-7-6-5-4-3-2
    if posicoes < 2
      # Retorno a posição para 9
      posicoes = 9
    i++
  # Captura o resto da divisão entre soma_digitos dividido por 11
  # Ex.: 196 % 11 = 9
  soma_digitos = soma_digitos % 11
  # Verifica se soma_digitos é menor que 2
  if soma_digitos < 2
    # soma_digitos agora será zero
    soma_digitos = 0
  else
    # Se for maior que 2, o resultado é 11 menos soma_digitos
    # Ex.: 11 - 9 = 2
    # Nosso dígito procurado é 2
    soma_digitos = 11 - soma_digitos
  # Concatena mais um dígito aos primeiro nove dígitos
  # Ex.: 025462884 + 2 = 0254628842
  cpf = digitos + soma_digitos
  # Retorna
  cpf

# calc_digitos_posicoes

valida_cpf = (valor) ->
  `var novo_cpf`
  # Garante que o valor é uma string
  valor = valor.toString()
  # Remove caracteres inválidos do valor
  valor = valor.replace(/[^0-9]/g, '')
  # Captura os 9 primeiros dígitos do CPF
  # Ex.: 02546288423 = 025462884
  digitos = valor.substr(0, 9)
  # Faz o cálculo dos 9 primeiros dígitos do CPF para obter o primeiro dígito
  novo_cpf = calc_digitos_posicoes(digitos)
  # Faz o cálculo dos 10 dígitos do CPF para obter o último dígito
  novo_cpf = calc_digitos_posicoes(novo_cpf, 11)
  # Verifica se o novo CPF gerado é idêntico ao CPF enviado
  if novo_cpf == valor
    # CPF válido
    true
  else
    # CPF inválido
    false

# valida_cpf

valida_cnpj = (valor) ->
  # Garante que o valor é uma string
  valor = valor.toString()
  # Remove caracteres inválidos do valor
  valor = valor.replace(/[^0-9]/g, '')
  # O valor original
  cnpj_original = valor
  # Captura os primeiros 12 números do CNPJ
  primeiros_numeros_cnpj = valor.substr(0, 12)
  # Faz o primeiro cálculo
  primeiro_calculo = calc_digitos_posicoes(primeiros_numeros_cnpj, 5)
  # O segundo cálculo é a mesma coisa do primeiro, porém, começa na posição 6
  segundo_calculo = calc_digitos_posicoes(primeiro_calculo, 6)
  # Concatena o segundo dígito ao CNPJ
  cnpj = segundo_calculo
  # Verifica se o CNPJ gerado é idêntico ao enviado
  if cnpj == cnpj_original
    return true
  # Retorna falso por padrão
  false

validates_cpf = (cpf) ->
  cpf = $.trim(cpf).replace(/\.|\-/g, '').split('')
  if cpf == '00000000000' or cpf == '11111111111' or cpf == '22222222222' or cpf == '33333333333' or cpf == '44444444444' or cpf == '55555555555' or cpf == '66666666666' or cpf == '77777777777' or cpf == '88888888888' or cpf == '99999999999'
    return false
  sum = 0
  i = 10
  $.each(cpf.slice(0, 9), ->
    sum += parseInt(this) * i
    i -= 1
  )
  result = sum % 11
  if result < 2
    result = 0
  else
    result = 11 - result
  if result != parseInt(cpf[9])
    return false
  sum = 0
  i = 11
  $.each(cpf.slice(0, 10), ->
    sum += parseInt(this) * i
    i -= 1
  )
  result = sum % 11
  if result < 2
    result = 0
  else
    result = 11 - result
  result == parseInt(cpf[10])

validates_cnpj = (cnpj) ->
  cnpj = $.trim(cnpj).replace(/[^0-9]/g, '').split('')
  sum  = 5 * parseInt(cnpj[0]) + 4 * parseInt(cnpj[1]) + 3 * parseInt(cnpj[2]) + 2 * parseInt(cnpj[3])
  sum += 9 * parseInt(cnpj[4]) + 8 * parseInt(cnpj[5]) + 7 * parseInt(cnpj[6]) + 6 * parseInt(cnpj[7])
  sum += 5 * parseInt(cnpj[8]) + 4 * parseInt(cnpj[9]) + 3 * parseInt(cnpj[10]) + 2 * parseInt(cnpj[11])
  sum = 11 - parseInt(sum % 11)
  if sum >= 10
    sum = 0
  if sum != parseInt(cnpj[12])
    return false
  sum = 6 * parseInt(cnpj[0]) + 5 * parseInt(cnpj[1]) + 4 * parseInt(cnpj[2]) + 3 * parseInt(cnpj[3])
  sum += 2 * parseInt(cnpj[4]) + 9 * parseInt(cnpj[5]) + 8 * parseInt(cnpj[6]) + 7 * parseInt(cnpj[7])
  sum += 6 * parseInt(cnpj[8]) + 5 * parseInt(cnpj[9]) + 4 * parseInt(cnpj[10]) + 3 * parseInt(cnpj[11])
  sum += 2 * parseInt(cnpj[12])
  sum = 11 - parseInt(sum % 11)
  if sum >= 10
    sum = 0
  sum == parseInt(cnpj[13])

jQuery ->
  $('#processo_nome').keyup (event) ->
    #$(this).val $(this).val().toUpperCase()
    $(this).val cleanUpSpecialChars($(this).val())

  $("textarea").keyup (event) ->
    #$(this).val $(this).val().toUpperCase()
    $(this).val cleanUpSpecialChars($(this).val())

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('body').on 'keyup', '.uppercase', (event) ->
    #$(this).val $(this).val().toUpperCase()
    $(this).val cleanUpSpecialChars($(this).val())
    return

  $('#processo_cpf').keyup (event) ->
    $('#validacao_cpf').html('')
    cpf = $("#processo_cpf").val()
    if cpf.match(/_/) == null
      if !validates_cpf($("#processo_cpf").val())
        $('#validacao_cpf').html('<span class="label label-important">CPF invalido</span>')
      else
        $('#validacao_cpf').html('')
      return

  $('#processo_cnpj').keyup (event) ->
    $('#validacao_cnpj').html('')
    cnpj = $("#processo_cnpj").val()
    if cnpj.match(/_/) == null
      if !validates_cnpj(cnpj)
        $('#validacao_cnpj').html('<span class="label label-important">CNPJ invalido</span>')
      else
        $('#validacao_cnpj').html('')
      return
