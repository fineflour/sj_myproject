 <% if @comment.destroyed? %>
   $('#comment-' +<%= @comment.id %>).hide();
    $('.js-comments-count').html("<%= @comment.user.comments.count %> comments");
 <% else %>
   $('#comment-' +<%= @comment.id %>).prepend("<div class='alert alert-error'><%= flash[:error] %></div>");
 <% end %>
