var Demo = (function() {

    function output(node) {
        var existing = $('#result .croppie-result');
        if (existing.length > 0) {
            existing[0].parentNode.replaceChild(node, existing[0]);
        }
        else {
            $('#result')[0].appendChild(node);
        }
    }
    function showimg(result) {
        if (result.html) {
            html = result.html;
        }
        if (result.src) {
            $('#userimg').prop('src',result.src);
            $('#upload').prop('src',result.src);
            var name = "Submit";
            document.getElementById('text').innerHTML = name.toString();

            document.getElementById('userimg').style.display = 'block';
            document.getElementById('upload-demo').style.display = 'none';
            document.getElementById('upload-result2').style.display="none";
            document.getElementById('upload-result3').style.display="block";

        }


    }

    function demoUpload() {
        var $uploadCrop;

        function readFile(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.upload-demo').addClass('ready');
                    document.getElementById('userimg').style.display = 'none';
                    document.getElementById('upload-demo').style.display = 'block';
                    document.getElementById('upload-result2').style.display='block';
                    var name = "Done";
                    document.getElementById('text').innerHTML = name.toString();
                    $uploadCrop.croppie('bind', {
                        url: e.target.result

                    }).then(function(){
                        console.log('jQuery bind complete');
                    });

                }

                reader.readAsDataURL(input.files[0]);
            }
            else {
                swal("Sorry - you're browser doesn't support the FileReader API");
            }
        }

        $uploadCrop = $('#upload-demo').croppie({
            viewport: {
                width: 150,
                height: 150,
                type: 'circle'
            },
            enableExif: true
        });

        $('#upload').on('change', function () { readFile(this); });
        $('.upload-result').on('click', function (ev) {

            $uploadCrop.croppie('result', {
                type: 'base64',
                format:'jpeg',
                //size: 'original'
                size: {width: 150,height: 150}
            })

                .then(function (resp) {
                var hidden_elem = document.getElementById("hidden");
                hidden_elem.value = resp;
                showimg({
                    src: resp
                });
            });
            
        });
    }
/*
    var form = document.getElementById("sub");

    document.getElementById("submit").addEventListener("click", function () {
        form.submit();
    });
*/
    function init() {
        document.getElementById('upload-result2').style.display="none";
        document.getElementById('upload-result3').style.display="none";
        demoUpload();
    }

    return {
        init: init
    };
})();
