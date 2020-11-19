{include file="head.tpl"}
<body>
{include file="header.tpl"}
<div class="container">
    <div class="row">
        <div class="col-6">
            <h2 class="mt-5 ml-4">Nuevo Producto</h2>
            <form class="mt-5 ml-4" action="producto" method="POST">
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationTooltipnombreproducto">Nombre Producto</label>
                        <input name="product_name" type="text" class="form-control" id="validationTooltipnombreproducto" placeholder="Producto" value="" required>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationTooltipprecioproducto">Precio</label>
                        <input name="product_price" type="number" class="form-control" id="validationTooltipprecioproducto" placeholder="Precio" value="" required>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationTooltipcategoriaproducto">Categoria</label>
                        <select name="id_categoria" class="form-control" id="exampleFormControlSelect1">
                        {foreach from=$categorias item=item }
                            <option value="{$item->id_categoria}">{$item->nombre_categoria}</option>
                        {/foreach}
                        </select>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                        
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="validationTooltipstockproducto">Stock</label>
                        <input name="product_stock"type="number" class="form-control" id="validationTooltipstockproducto" placeholder="Stock" value="" required>
                        <div class="invalid-tooltip">
                            Please provide a valid Stock.
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label for="validationTooltipdescripcionproducto">Descripción</label>
                        <input name="product_description" type="text" class="form-control" id="validationTooltipdescripcionproducto" placeholder="¿Que forma tiene?" value="" required>
                        <div class="invalid-tooltip">
                            Please provide a valid Descripción.
                        </div>
                    </div>
                </div>
                <button class="btn btn-success" type="submit">Crear</button>
            </form>
        </div>
        <div class="col-6">
            
            <h2 class="mt-5 ml-1">Nueva Categoria</h2>
            <form class="mt-1 ml-1 mb-5" action="categoria" method="POST">
                <div class="form-row mt-5">
                    <div class="form-col col-8">
                        <div class="col-md-12 mb-1">
                            <label for="validationTooltipnombrecategoria">Nombre categoria</label>
                            <input name="nombre_categoria" type="text" class="form-control" id="validationTooltipnombrecategoria" placeholder="Categoria" value="" required>
                            <div class="valid-tooltip">
                                Looks good!
                            </div>
                        </div>
                        <div class="col-md-12 mb-1">
                            <label for="validationTooltipnombrecategoria">Descripción</label>
                            <label for="exampleFormControlTextarea1">Descripción</label>
                            <textarea class="form-control" name="descripcion_categoria" rows="3" id="validationTooltipnombrecategoria" placeholder="Categoria" value="" required></textarea>
                            <div class="valid-tooltip">
                                Looks good!
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-success mt-4" type="submit">Crear</button>
            </form>
        </div>
    </div>
</div>
<!-- SECCION BOTONES PARA CARGAR TABLAS-->
<div class="container centrado ">
    <button type="button" class="btn btn-primary ml-2 mr-2" id="toggleProducto" onclick="mostrarProductos()">Productos</button>
    <button type="button" class="btn btn-secondary ml-2 mr-2" id="toggleCategoria" onclick="mostrarCategorias()">Categorias</button>
    <button type="button" class="btn btn-secondary ml-2 mr-2" id="toggleCategoria" onclick="mostrarUsuarios()">Usuarios</button>
    <button type="button" class="btn btn-secondary ml-2 mr-2" id="toggleCategoria" onclick="mostrarComentarios()">Comentarios</button>
</div>
<div class="container">
    <div class="row mt-4">
        <section id="tablaProductos" class="centrado">
            <div class="table-responsive">
                <table class="table table-bordered tabla" id="table-container-productos">
                    <thead class="tabla thead">
                        <tr>
                            <th scope="col">Producto</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>        
                    <tbody class="tabla-container">
                        {foreach from=$productos item=item }
                        <tr>
                            <td>{$item->nombre_producto}</td>
                            <td>{$item->precio_producto}</td>
                            <td>{$item->stock_producto}</td>
                            <td>{$item->description_producto}</td> 
                            <td>
                                <div class='actions mb-1'>
                                    <a href="producto/{$item->id_producto}" class="button">
                                        <button type="button" class="btn btn-success">Editar</button>
                                    </a>
                                </div>
                                <div class='actions mb-1'>
                                    <form action="producto/borrar/{$item->id_producto}" method="POST">
                                        <button type="submit" class="btn btn-danger">Borrar</button>
                                    </form>
                                </div>
                            </td>
                        </tr>   
                        {/foreach} 
                    </tbody>
                </table>
            </div>
        </section>
        <section id="tablaCategorias" class="centrado display-none">
            <div class="table-responsive">
                <table class="table table-bordered tabla" id="table-container-categorias">
                    <thead class="tabla thead">
                        <tr>
                            <th scope="col">Nombre Categoria</th>
                            <th scope="col">Descripion</th>
                            <th scope="col">Accion</th>
                        </tr>
                    </thead>        
                    <tbody class="tabla-container">
                    </tbody>
                </table>
            </div>
        </section>
        <section id="tablaUsuarios" class="centrado col-md-8 offset-2 display-none">
            <div class="table-responsive">
                <table class="table table-bordered tabla" id="table-container-usuarios">
                    <thead class="tabla thead">
                        <tr>
                            <th scope="col">Nombre Usuario</th>
                            <th scope="col">Email</th>
                            <th scope="col">Permisos</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="tabla-container">
                    </tbody>
                </table>
            </div>
        </section>
        <section id="tablaComentarios" class="centrado col-md-8 offset-2 display-none">
            <div class="table-responsive">
                <table class="table table-bordered tabla" id="table-container-comentarios">
                    <thead class="tabla thead">
                        <tr>
                            <th scope="col">Nombre Usuario</th>
                            <th scope="col">Puntuacion</th>
                            <th scope="col">Comentario</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="tabla-container">
                    </tbody>
                </table>
            </div>
        </section>
        <!--SECCION DE EDICION-->
        <div id="editUserContainer" class="display-none col-md-8 offset-2 mb-5">
            <form class="mt-5 ml-4" action="user/edit" id="usereditform" method="POST">
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationTooltipuser">Nombre Usuario</label>
                        <input name="nombre_user" type="text" class="form-control" id="validationTooltipuser" placeholder="Nombre Usuario" value="" required>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationTooltipemail">Email</label>
                        <input name="email_user" type="text" class="form-control" id="validationTooltipemail" placeholder="Email" value="" required>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationTooltippermiso">Permisos</label>
                        <select name="permiso" class="form-control" id="permiso_select">
                            <option value="0">PUBLICO</option>
                            <option value="1">ADMIN</option>
                        </select>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                    </div>
                    <input name="id_user" id="id_user" type="number" class="display-none" value="">
                </div>
                <button class="btn btn-success" type="submit">Editar</button>
                <button class="btn btn-dark" type="button" onclick="cancelEdit()">Cancelar</button>
            </form>
        </div>
        <div id="editComentarioContainer" class="display-none col-md-8 offset-2 mb-5">
            <form class="mt-5 ml-4" action="comentario/edit"id="comentarioeditform" method="POST">
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <h2>Usuario</h2>
                        <p id="label_user_name"></p>
                    </div>
                    <div class="col-md-4 mb-3">
                        <h2>Puntuacion</h2>
                        <p id="label_Puntuacion"></p>
                    </div>
                    <div class="col-md-4 mb-3">
                        <h2>Producto</h2>
                        <p id="label_Producto"></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-12 mb-3">
                        <div class="form-group">
                            <label for="validationTooltipcomentario">Comentario</label>
                            <textarea  name="comentario" type="text" class="form-control" rows="3" id="validationTooltipcomentario" placeholder="Comentario..." value="" required></textarea>
                        </div>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                    </div>
                    <!--SECCCION ID PARA USO DEL SISTEMA-->
                    <input name="id_comentario" id="id_comentario" type="number" class="display-none" value="">
                </div>
                <button class="btn btn-success" type="submit">Editar</button>
                <button class="btn btn-dark" type="button" onclick="cancelEditComentario()">Cancelar</button>
            </form>
        </div>
    </div>
</div>
<script src="js/admin.js" crossorigin="anonymous">
</script>
</body>

{include file="footer.tpl"}
