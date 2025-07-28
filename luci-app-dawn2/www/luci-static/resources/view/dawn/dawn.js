'use strict';
return L.view.extend({
  render: function() {
    return E('div', {}, [
      E('h2', {}, 'DAWN2'),
      E('p', {}, 'La vista DAWN2 se ha cargado correctamente. Puedes personalizar aquí la interfaz.')
    ]);
  }
});