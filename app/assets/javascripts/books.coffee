$(document).on 'ready page:load', -> # turbolinks対策
  ### ISBNコード入力フォーム：数値のみの入力 ###
  $('#book_isbn').keydown ->
    presskey = String.fromCharCode(event.keyCode);
    event.returnValue = /[0-9\b\t\n]/.test(presskey) # 入力受付キーを正規表現で指定

  ### 書籍情報取得ボタン：Ajaxで情報取得 ###
  $('#info_search_button').click ->
    isbncode = $('#book_isbn').val()
    $.ajax
      async:    true
      url:      "/books/new/get_info/"
      type:     "GET"
      data:     {isbn: isbncode}
      dataType: "json"
      context:  this
      error: (jqXHR, textStatus, errorThrown) -> # 通信/サーバエラーなど
        $("#msg").css("color","#ff0000").html(errorThrown)
      success:  (data, textStatus, jqXHR) ->
        if data?
          $("#book_title").val(data.Title) # タイトル
          $("#book_author").val(data.Author) # 著者
          $("#book_manufacturer").val(data.Manufacturer) # 出版社
          $("#book_publication_date").val(data.Publication_Date) # 出版日
        else
          $("#msg").css("color","#ff0000").html("書籍情報が見つかりませんでした。")

  ### MSGのリセット ###
  $("#book_isbn").change -> $("#msg").html("")