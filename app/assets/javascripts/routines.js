$(document).ready(function() {
  $('.delete-routine').click(function(e) {
    e.preventDefault();
    var routineId = $(this).data('routine-id');
    var confirmDelete = confirm('Tem certeza que deseja excluir a rotina?');
    if (confirmDelete) {
      deleteRoutine(routineId);
    }
  });

  function deleteRoutine(routineId) {
    $.ajax({
      url: '/routines/' + routineId,
      type: 'DELETE',
      success: function() {
        // Exibição de mensagem ou qualquer outra ação após a exclusão
        alert('Rotina excluída com sucesso!');
        // Atualizar a tabela ou recarregar a página, se necessário
        // Exemplo: window.location.reload();
      },
      error: function() {
        // Tratamento de erro, se necessário
        alert('Ocorreu um erro ao excluir a rotina.');
      }
    });
  }
});