/*function templaterow() {
    var template = "<tr>";
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "jorge junior" + "</td>");
    template += ("<td>" + "rodriguez castillo" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += ("<td>" + "123" + "</td>");
    template += "</tr>";
    return template;
}

function addrow() {
    var template = templaterow();
    for (var i = 0; i < 10; i++) {
        $("#tbl_body_table").append(template);
    }
}*/

//var tabla, data;

function addRowDT(data) {
    var tabla = $("#tbl_pacientes").DataTable();
        for(var i = 0; i<data.length; i++) {
            tabla.fnAddData([
                data[i].Curp,
                data[i].Nombres,
                data[i].ApPaterno,
                data[i].ApMaterno,
                data[i].FecNac,
                data[i].EdoNac,
                ((data[i].Sexo == 'M') ? "masculino" : "femenino"),
                data[i].NacOrigen,
                data[i].Folio,
                data[i].Estado,
                data[i].Municipio,
                data[i].Localidad,
                data[i].TipoBeneficiario,
                data[i].ClaveDependencia,
                data[i].ClavePrograma,
                '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' +
                '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'
            ]);
        }
}
    
function sendDataAjax() {
    $.ajax({
        type: "POST",
        url: "GestionarPaciente.aspx/ListarPacientes",
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

sendDataAjax();

//// evento click para boton actualizar
//$(document).on('click', '.btn-edit', function (e) {
//    e.preventDefault();

//    var row = $(this).parent().parent()[0];
//    data = tabla.fillModalData(row);
//    fillModalData();

//});

//// evento click para boton eliminar
//$(document).on('click', '.btn-delete', function (e) {
//    e.preventDefault();

//    //primer método: eliminar la fila del datatble
//    var row = $(this).parent().parent()[0];
//    var dataRow = tabla.fnGetData(row);

//    //segundo método: enviar el codigo del paciente al servidor y eliminarlo, renderizar el datatable
//    // paso 1: enviar el id al servidor por medio de ajax
//    deleteDataAjax(dataRow[0]);
//    // paso 2: renderizar el datatable
//    sendDataAjax();

//});

//function updateDataAjax() {

//    var obj = JSON.stringify({ id: JSON.stringify(data[0]), direccion: $("#txtModalDireccion").val() });

//    $.ajax({
//        type: "POST",
//        url: "GestionarPaciente.aspx/ActualizarDatosPaciente",
//        data: obj,
//        dataType: "json",
//        contentType: 'application/json; charset=utf-8',
//        error: function (xhr, ajaxOptions, thrownError) {
//            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
//        },
//        success: function (response) {
//            if (response.d) {
//                alert("Registro actualizado de manera correcta.");
//            } else {
//                alert("No se pudo actualizar el registro.");
//            }
//        }
//    });
//}

//function deleteDataAjax(data) {

//    var obj = JSON.stringify({ id: JSON.stringify(data) });

//    $.ajax({
//        type: "POST",
//        url: "GestionarPaciente.aspx/EliminarDatosPaciente",
//        data: obj,
//        dataType: "json",
//        contentType: 'application/json; charset=utf-8',
//        error: function (xhr, ajaxOptions, thrownError) {
//            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
//        },
//        success: function (response) {
//            if (response.d) {
//                alert("Registro eliminado de manera correcta.");
//            } else {
//                alert("No se pudo eliminar el registro.");
//            }
//        }
//    });
//}




//// cargar datos en el modal
//function fillModalData() {
//    $("#txtFullName").val(data[1] + " " + data[2]);
//    $("#txtModalDireccion").val(data[5]);
//}

//// enviar la informacion al servidor
//$("#btnactualizar").click(function (e) {
//    e.preventDefault();
//    updateDataAjax();
//});

//Llamando a la funcion de ajax al cargar el documento
