<% if @comment.valid? %>
 $('.js-comments').prepend("<%= escape_javascript(render(@comment)) %>");
  $('.new-comment').html("<%= escape_javascript(render partial: 'comments/form', locals: {post: @post, comment: @new_comment }) %>");
<% else %>
 $('.new-comment').html("<%= escape_javascript(render partial: 'comments/form', locals: { post: @post, comment: @comment }) %>");
<% end %>
