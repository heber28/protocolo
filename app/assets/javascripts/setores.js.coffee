# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.datatables').dataTable
    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    iDisplayLength: 10
    aLengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "Todos"]
    ]
    oLanguage:
      {
      sLengthMenu: "Mostrar _MENU_ registros"
      sSearch: "Pesquisar:"
      oPaginate:
        {
        sPrevious: "Anterior"
        sNext: "Próximo"
        }
      sInfoEmpty: ""
      sInfo: ""
      sInfoFiltered: ""
      sEmptyTable: ""
      sZeroRecords: ""
      bRetrieve: true
      }
