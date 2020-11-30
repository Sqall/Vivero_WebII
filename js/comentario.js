"use strict"
document.addEventListener("DOMContentLoaded", function(){
    
    let comentario_form = document.getElementById('comentario_form');
    if(comentario_form){
        document.getElementById('comentario_form').addEventListener('submit',function(event){
            event.preventDefault();
            let bodyData = {
                "id" : document.querySelector('#id_producto').value 
            }
            let formData = new FormData(document.getElementById('comentario_form'));
            for(var pair of formData.entries()) {
                bodyData[pair[0]] = pair[1];
            }
            
            fetch(`api/comentario`, {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json'
                  },
                body: JSON.stringify(bodyData),
                mode:"cors",
                
            })
            .then(response => response.text())
            .then(response => {
                mostrarComentarios();
                console.log(response);
            });
        });     
    }
   
    

    function mostrarComentarios(){
        let id = document.querySelector('#id_producto');
        fetch(`api/comentarios/${id.value}`)
        .then(response => response.json())
        .then(response => {
            let content = document.querySelector('#container_comentarios');  
            content.innerHTML = "" ;
            for(let comentario of response){
            content.innerHTML +=crearComentarioHTML(comentario);
            }
        })
        .catch(error => console.log(error));
    }

    mostrarComentarios();

    function crearComentarioHTML(comentario) {
        let element = `${comentario.comentario} - ${comentario.puntuacion}`;
        element = `<li>${element}</li>`;
        return element;  
    }
});

function deleteComentario(id){
    fetch(`api/comentario/${id}`, {
        "method": "DELETE",
        "mode":"cors",
    })
    .then(response => response.json())
    .then(data => {
        // Armar respuesta en caso de mostrar mensaje de error
        mostrarComentarios();
    });
}
