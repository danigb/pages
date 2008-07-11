
var controls = { controls : {html : {visible : false}, 
    createLink : {
        visible : true,
        exec    : function( self )
        {            
            
        }},
        
        insertSiteImage : {
            visible   : true,
            className : 'insertImage',
            exec      : function( self )
            {
                Editor.selectImage();
            },
            
            tags : ['img']
        }
    }
};

var Editor = {
    editor : null,
    imageSelectURL : null,
    
    init : function (imageSelectURL) {
        Editor.imageSelectURL = imageSelectURL;
        $('#wysiwyg').wysiwyg(controls);
    },
    
    selectImage : function () {
        console.log("selectImage");
        jQuery.facebox(function() {
            jQuery.get(Editor.imageSelectURL, function(data) {
                jQuery.facebox(data);
                $("#images div.attachment").hover(
                    function () {
                        $(this).addClass('selected');
                    },
                    function () {
                        $(this).removeClass('selected');
                    }
                ).click (function () {
                    var url = $(this).find(".url").text();
                    $('#wysiwyg').wysiwyg('insertImage', url);
                    $.facebox.close
                });
                
            })
        });
    }
}
