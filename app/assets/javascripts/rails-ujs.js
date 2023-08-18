$(document).on('click', 'a[data-method="delete"]', function(e) {
  e.preventDefault(); // Impede o comportamento padrão do link

  var $link = $(this);
  var url = $link.attr('href');
  var csrfToken = $('meta[name="csrf-token"]').attr('content'); // Obtém o token CSRF

  // Cria uma solicitação AJAX DELETE
  $.ajax({
    url: url,
    method: 'DELETE',
    headers: {
      'X-CSRF-Token': csrfToken // Define o token CSRF no cabeçalho da solicitação
    },
    success: function(response) {
      // Executa essa função quando a solicitação DELETE é bem-sucedida
      // Por exemplo, você pode redirecionar para outra página ou atualizar a lista de rotinas
      window.location.reload();
    },
    error: function(xhr, status, error) {
      // Executa essa função quando ocorre um erro na solicitação DELETE
      // Por exemplo, você pode exibir uma mensagem de erro ao usuário
      console.log(error);
    }
  });
});