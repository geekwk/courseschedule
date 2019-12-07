var buttonsGroup ={
        dom: "Blfrtip",
        buttons: [
            {
                extend: "copy",
                className: "btn-sm"
            },
            {
                extend: "csv",
                className: "btn-sm"
            },
            {
                extend: "excel",
                className: "btn-sm"
            },
            {
                extend: "pdfHtml5",
                className: "btn-sm"
            },
            {
                extend: "print",
                className: "btn-sm"
            },
        ],
        responsive: true
    }

/* AUTOCOMPLETE */
function autoComplete(id,url,data) {
    $.ajax({
        type:"POST",
        url: url,
        data:data,
        success: function(resp){
            var countries = {};
            var data= resp.data.data
            for(var i = 0;i<data.length;i++){
                countries[i] = " "+data[i]
            }
            console.log(countries)
            init_autocomplete(countries,id)
        }
    })
}

function init_autocomplete(countries,id) {

    if (typeof ($.fn.autocomplete) === 'undefined') {
        return;
    }
    var countriesArray = $.map(countries, function (value, key) {
        return {
            value: value,
            data: key
        }
    })
    // initialize autocomplete with custom appendTo
    $('#'+id).autocomplete({
        lookup: countriesArray
    })
}


/**
 * Log an error message
 *  @param {object} settings dataTables settings object
 *  @param {int} level log error messages, or display them to the user
 *  @param {string} msg error message
 *  @param {int} tn Technical note id to get more information about the error.
 *  @memberof DataTable#oApi
 */
function _fnLog( settings, level, msg, tn )
{
    msg = 'DataTables warning: '+
        (settings ? 'table id='+settings.sTableId+' - ' : '')+msg;

    if ( tn ) {
        msg += '. For more information about this error, please see '+
            'http://datatables.net/tn/'+tn;
    }

    if ( ! level  ) {
        // Backwards compatibility pre 1.10
        var ext = DataTable.ext;
        var type = ext.sErrMode || ext.errMode;

        if ( settings ) {
            _fnCallbackFire( settings, null, 'error', [ settings, tn, msg ] );
        }

        if ( type == 'alert' ) {
            console.log( msg );
            alert("wangkang")
        }
        else if ( type == 'throw' ) {
            throw new Error(msg);
        }
        else if ( typeof type == 'function' ) {
            type( settings, tn, msg );
        }
    }
    else if ( window.console && console.log ) {
        console.log( msg );
    }
}