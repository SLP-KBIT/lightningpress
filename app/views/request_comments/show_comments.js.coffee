$('#request_comments').append("<%= escape_javascript( render partial: 'request_comments/show' ) %>")
$('#request_comment').dropdown()
