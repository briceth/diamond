jQuery ->
  $("#q").autocomplete(
    source: "/proposals/autocomplete",
    minLength: 2
  )
