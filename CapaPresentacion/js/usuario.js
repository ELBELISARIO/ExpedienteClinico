var tabla, data;

function addRowDT(data) {
    tabla = $("#tbl_usuarios").DataTable();
    for (var i = 0; i < data.length; i++) {
        tabla.fnAddData([
            data[i].idUser,
            data[i].userName,
            data[i].email,
            data[i].password,
            data[i].rol,
            data[i].telefono,
            data[i].direccion,
            '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' +
            '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'
        ]);
    }
}

//Ajax para enviar datos
function sendDataAjax() {
    $.ajax({
        type: "POST",
        url: "GestionarUsuario.aspx/ListarUsuarios",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            addRowDT(data.d);
            //console.log(data);
        }
    });
}
//Ajax para actualizar
function updateDataAjax() {

    var obj = JSON.stringify({ id: JSON.stringify(data[0]), password: $("#txtModalPassword").val() });

    $.ajax({
        type: "POST",
        url: "GestionarUsuario.aspx/ActualizarDatosUsuario",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro actualizado de manera correcta.");
            } else {
                alert("No se pudo actualizar el registro.");
            }
        }
    });
}
//Ajax para eliminar
function deleteDataAjax(data) {

    var obj = JSON.stringify({ id: JSON.stringify(data) });

    $.ajax({
        type: "POST",
        url: "GestionarUsuario.aspx/EliminarDatosUsuario",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro eliminado de manera correcta.");
            } else {
                alert("No se pudo eliminar el registro.");
            }
        }
    });
}


// evento click para boton actualizar
$(document).on('click', '.btn-edit', function (e) {
    e.preventDefault();
    var row = $(this).parent().parent()[0];
    data = tabla.fnGetData(row);
    fillModalData();
});

//Evento click para boton eliminar
$(document).on('click', '.btn-delete', function (e) {
    //primer método: eliminar la fila del datatble
    var row = $(this).parent().parent()[0];
    var dataRow = tabla.fnGetData(row);

    //segundo método: enviar el codigo del paciente al servidor y eliminarlo, renderizar el datatable
    // paso 1: enviar el id al servidor por medio de ajax
    deleteDataAjax(dataRow[0]);
    // paso 2: renderizar el datatable
    tabla.clear().draw();
    sendDataAjax();
});

// cargar datos en el modal
function fillModalData() {
    $("#txtModalUserName").val(data[1]);
}

// enviar la informacion al servidor
$("#btnactualizar").click(function (e) {
    e.preventDefault();
    updateDataAjax();
});

sendDataAjax();